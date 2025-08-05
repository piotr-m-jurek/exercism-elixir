defmodule KitchenCalculator do
  def get_volume({_measurement, volume}), do: volume

  def to_milliliter(volume_pair) do
    case volume_pair do
      {:milliliter, vol} -> {:milliliter, vol * 1}
      {:cup, vol} -> {:milliliter, vol * 240}
      {:fluid_ounce, vol} -> {:milliliter, vol * 30}
      {:teaspoon, vol} -> {:milliliter, vol * 5}
      {:tablespoon, vol} -> {:milliliter, vol * 15}
    end
  end

  def from_milliliter(volume_pair, unit) do
    case {unit, elem(volume_pair,1)} do
      {:milliliter, volume} -> {:milliliter, volume / 1}
      {:cup, volume} -> {:cup, volume / 240}
      {:fluid_ounce, volume} -> {:fluid_ounce, volume / 30}
      {:teaspoon, vol} -> {:teaspoon, vol / 5}
      {:tablespoon, vol} -> {:tablespoon, vol / 15}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair 
    |> to_milliliter()
    |> then(&(from_milliliter(&1, unit)))
  end
end
