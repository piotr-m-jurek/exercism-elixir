defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    ?A..?H
  end

  def ranks do
    Enum.into(1..8,[])
  end

  def files do
    Enum.map(?A..?H, &(<<&1>>))
  end
end
