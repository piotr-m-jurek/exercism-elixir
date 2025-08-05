defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  
  @spec value(colors :: [atom]) :: integer
  def value([first, second | _]), do: String.to_integer("#{single_value(first)}#{single_value(second)}")

  
  def single_value(:black), do: 0
  def single_value(:brown), do: 1
  def single_value(:red), do: 2
  def single_value(:orange), do: 3
  def single_value(:yellow), do: 4
  def single_value(:green), do: 5
  def single_value(:blue), do: 6
  def single_value(:violet), do: 7
  def single_value(:grey), do: 8
  def single_value(:white), do: 9
end
