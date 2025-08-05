defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts :: opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot(), frame_number(), opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts) do
        {:ok, opts}
      end

      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  def handle_frame(%DancingDots.Dot{} = dot, frame_number, opts) when rem(frame_number, 4) === 0,
    do: %DancingDots.Dot{dot | opacity: dot.opacity / 2}

  def handle_frame(%DancingDots.Dot{} = dot, _, opts), do: dot
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  def init(opts) do
    velocity = Keyword.get(opts, :velocity)

    if is_number(velocity) do
      {:ok, opts}
    else
      {:error,
       "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
    end
  end

  def handle_frame(%DancingDots.Dot{} = dot, frame, [velocity: velocity]) do
    incr_by = (frame - 1) * velocity
    %DancingDots.Dot{dot | radius: dot.radius + incr_by}
  end
end
