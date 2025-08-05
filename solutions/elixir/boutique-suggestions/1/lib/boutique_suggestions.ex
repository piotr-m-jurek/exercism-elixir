defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, opts \\ []) do
    max_price = Keyword.get(opts, :maximum_price)

    for %{base_color: c1, price: p1} = top <- tops,
        %{base_color: c2, price: p2} = bottom <- bottoms,
        c1 !== c2,
        price_check(p1 + p2, max_price) do
      {top, bottom}
    end
  end

  defp price_check(total, nil), do: total <= 100
  defp price_check(total, maximum), do: total <= maximum
end
