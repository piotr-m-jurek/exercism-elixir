defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}

  def hamming_distance(strand1, strand2) when length(strand1) !== length(strand2),
    do: {:error, "strands must be of equal length"}

  def hamming_distance(strand1, strand2),
    do: {:ok, do_hamming(strand1, strand2, 0)}

  defp do_hamming([], [], count), do: count
  defp do_hamming([], [], count), do: count

  defp do_hamming([ch | rest1], [ch | rest2], count), do: do_hamming(rest1, rest2, count)

  defp do_hamming([_ | rest1], [_ | rest2], count), do: do_hamming(rest1, rest2, count + 1)
end
