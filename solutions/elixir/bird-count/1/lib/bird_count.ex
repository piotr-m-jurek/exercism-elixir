defmodule BirdCount do
  def today([]), do: nil
  def today([el | _]), do: el

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]),do: [today + 1 | rest]

  def has_day_without_birds?(list) do
    case list do
      [] -> false
      [0 | _] -> true
      [_ | tail] -> has_day_without_birds?(tail)
    end
  end

  def total(list) do
    case list do
      [] -> 0
      [head | tail] -> head + total(tail)
    end
  end

  def busy_days(list) do
    case list do
      [] -> 0
      [head | tail] when head >= 5 -> busy_days(tail) + 1
      [_ | tail] -> busy_days(tail)
    end
  end
end
