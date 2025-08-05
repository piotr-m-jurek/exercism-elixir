# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  defstruct next_id: 1, plots: []

  def start(opts \\ []) do
    Agent.start_link(fn -> %CommunityGarden{plots: opts} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      new_plot = %Plot{
        plot_id: state.next_id,
        registered_to: register_to
      }

      next_id = state.next_id + 1

      new_state = %CommunityGarden{
        state
        | plots: [new_plot | state.plots],
          next_id: next_id
      }

      {new_plot, new_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn state ->
      new_plots = Enum.filter(state.plots, fn plot -> plot.plot_id !== plot_id end)
      new_state = %CommunityGarden{state | plots: new_plots}
      {:ok, new_state}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      case Enum.find(state.plots, fn plot -> plot.plot_id === plot_id end) do
        nil -> {:not_found, "plot is unregistered"}
        v -> v
      end
    end)
  end
end
