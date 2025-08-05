defmodule LanguageList do
  def new(), do: []

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    case list do
      [_ | list] -> list
      [] -> []
    end
  end

  def first(list) do
    case list do
      [] -> []
      [head | _] -> head
    end
  end

  def count(list) do
    case list do
      [] -> 0
      [_ | tail] -> 1 + count(tail)
    end
  end

  def functional_list?(list) do
    case list do
      [] -> false
      ["Elixir" | _] -> true
      [_ | tail] -> false || functional_list?(tail)
      
    end
  end
end
