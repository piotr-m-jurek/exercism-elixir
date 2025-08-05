defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}

  def trade_card(your_card, their_card, collection) do
    result =
      cond do
        MapSet.size(collection) === 0 ->
          {false, MapSet.put(collection, their_card)}

        MapSet.member?(collection, their_card) === true ->
          {false, MapSet.delete(collection, your_card)}

        MapSet.member?(collection, your_card) === false ->
          {false, MapSet.put(collection, their_card)}

        true ->
          new_collection =
            MapSet.put(collection, their_card)
            |> (fn c -> MapSet.delete(c, your_card) end).()

          {true, new_collection}
      end

    result
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    MapSet.new(cards) |> MapSet.to_list()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    MapSet.difference(your_collection, their_collection) |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []

  def boring_cards(collections) do
    Enum.reduce(collections, MapSet.new(), fn col, acc ->
      if(MapSet.size(acc) === 0, do: col, else: MapSet.intersection(acc, col))
    end)
    |> Enum.sort()
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards(collections) do
    Enum.reduce(collections, MapSet.new(), fn col, acc -> MapSet.union(acc, col) end)
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny, not_shiny} =
      MapSet.split_with(collection, fn e -> String.starts_with?(e, "Shiny") end)

    {Enum.into(shiny, []), Enum.into(not_shiny, [])}
  end
end
