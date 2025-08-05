defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}

  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn d -> d < 0 or d >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      digits
      |> to_base10(input_base)
      |> from_base10(output_base)
      |> then(&{:ok, &1})
    end
  end

  defp to_base10(string, input_base) do
    string
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {v, i}, acc ->
      digit = v * Integer.pow(input_base, i)
      acc + digit
    end)
  end

  defp from_base10(string, output_base, acc \\ [])
  defp from_base10(0, _, []), do: [0]
  defp from_base10(0, _, acc), do: acc

  defp from_base10(string, output_base, acc) do
    from_base10(div(string, output_base), output_base, [rem(string, output_base) | acc])
  end
end
