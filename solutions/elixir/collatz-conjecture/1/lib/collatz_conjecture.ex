defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """

  defmacro is_odd(input) do
    quote do
      rem(unquote(input), 2) == 1
    end
  end

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(0), do: raise(FunctionClauseError)
  def calc(1), do: 0
  def calc(input), do: do_calc(input, 0)

  def do_calc(1, steps), do: steps
  def do_calc(num, steps) when is_odd(num), do: do_calc(num * 3 + 1, steps + 1)
  def do_calc(num, steps) when Integer.is_even(num), do: do_calc(div(num, 2), steps + 1)
end
