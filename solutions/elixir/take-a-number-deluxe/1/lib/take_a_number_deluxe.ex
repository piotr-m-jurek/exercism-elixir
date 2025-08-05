defmodule TakeANumberDeluxe do
  # Client API
  use GenServer

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :report_state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue_number)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve_next, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset)
  end

  # Server callbacks
  @impl GenServer
  def init(init_arg) do
    min = init_arg[:min_number]
    max = init_arg[:max_number]
    shutdown = init_arg[:auto_shutdown_timeout] || :infinity

    TakeANumberDeluxe.State.new(min, max, shutdown)
    |> case do
      {:ok, state} ->
        {:ok, state, shutdown}
        
      {:error, err} ->
      {:stop, err}
    end
  end

  @impl GenServer
  def handle_call(:report_state, _from, %TakeANumberDeluxe.State{} = state) do
    # It's state state, because we don't change the state, therefore no need to return old / new
    {:reply, state, state, state.auto_shutdown_timeout}
  end

  @impl GenServer
  def handle_call(:queue_number, _from, %TakeANumberDeluxe.State{} = state) do
    case TakeANumberDeluxe.State.queue_new_number(state) do
      {:ok, number, new} = resp -> 
        {:reply, {:ok, number}, new, new.auto_shutdown_timeout}
        
      {:error, error} -> 
        {:reply, {:error, error}, state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  def handle_call({:serve_next, priority}, _from, %TakeANumberDeluxe.State{} = state) do
    case TakeANumberDeluxe.State.serve_next_queued_number(state, priority) do
      {:ok, next_number, next_state} -> 
         {:reply, {:ok, next_number}, next_state, state.auto_shutdown_timeout}
         
      v -> 
        {:reply, v, state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  def handle_cast(:reset, %TakeANumberDeluxe.State{} = state) do
    case TakeANumberDeluxe.State.new(state.min_number, state.max_number, state.auto_shutdown_timeout) do
    {:ok, new_state} -> 
      {:noreply, new_state, state.auto_shutdown_timeout}
    end
  end

  @impl GenServer
  def handle_info(:timeout, %TakeANumberDeluxe.State{} = state) do
    {:stop, :normal, state}
  end

  @impl GenServer
  def handle_info(_, s), do: {:noreply, s, s.auto_shutdown_timeout}

end
