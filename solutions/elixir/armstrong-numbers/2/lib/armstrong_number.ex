defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    len = length(digits)
    number ==digits |> Enum.map(fn d -> d ** len end) |> Enum.sum() 

  end
end
