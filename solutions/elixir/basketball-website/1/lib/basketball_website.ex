defmodule BasketballWebsite do
  def extract_from_path(data, path), do: traverse(data, String.split(path, "."))

  defp traverse(data, []), do: data
  defp traverse(data, [token | tail]), do: traverse(data[token], tail)

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
