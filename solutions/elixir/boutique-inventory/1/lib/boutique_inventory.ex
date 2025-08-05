defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    update_element = fn {key, value} -> {key, value + count} end

    new_sizes =
      Enum.into(item.quantity_by_size, %{}, update_element)
      |> (fn e -> Enum.into(e, %{}) end).()

    %{item | quantity_by_size: new_sizes}
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, v}, acc -> v + acc end)
  end
end
