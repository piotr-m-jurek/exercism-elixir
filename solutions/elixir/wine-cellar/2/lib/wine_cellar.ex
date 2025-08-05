defmodule WineCellar do
  def explain_colors do
    [{:white, "Fermented without skin contact."},
    {:red, "Fermented with skin contact using dark-colored grapes."},
    {:rose, "Fermented with some skin contact, but not enough to qualify as a red wine."}
    ]
  end

  def filter(cellar, color, opts \\ []) do
    result = case cellar do
      [{what, which} | tail] when what == color -> [which | filter(tail, color, opts)]
      [_ | tail] -> filter(tail, color, opts)
      [] -> []
    end
    
    year_filter = Keyword.get(opts, :year)
    country_filter = Keyword.get(opts, :country)
    by_year = if(year_filter != nil, do: filter_by_year(result, year_filter), else: result)
    by_country = if(country_filter != nil, do: filter_by_country(by_year, country_filter), else: by_year)
    by_country
  end

  
  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
