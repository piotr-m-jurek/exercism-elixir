defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    length = Integer.to_string(number) |> String.length()
    powers = number 
      |> Integer.to_string()
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.reduce(0, fn n, acc -> Integer.pow(n, length) + acc end) 
    powers == number
  end
end
