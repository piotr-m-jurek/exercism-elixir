defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_set =
      base |> String.downcase() |> String.graphemes() |> Enum.sort()

    candidates
    |> Enum.filter(fn candidate ->
      cand = candidate |> String.downcase() |> String.graphemes() |> Enum.sort()

      Enum.count(cand) === Enum.count(base_set) and
        Map.equal?(Enum.frequencies(cand), Enum.frequencies(base_set)) and
        base |> String.downcase() !== candidate |> String.downcase()
    end)
  end
end
