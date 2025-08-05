defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    smallest_positive(1, color_count)
  end

  defp smallest_positive(x, containing) do
    cond do
      2 ** x >= containing -> x
      2 ** x < containing -> smallest_positive(x + 1, containing)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)

    case picture do
      <<pixel::size(size), _::bitstring>> ->
        pixel

      _ ->
        nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)

    case picture do
      <<>> ->
        <<>>

      <<_::size(size), rest::bitstring>> ->
        <<rest::bitstring>>

      _ ->
        nil
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
