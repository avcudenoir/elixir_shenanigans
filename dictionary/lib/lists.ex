defmodule Lists do
  def sum_pairs([]), do: []
  def sum_pairs([h1, h2 | t]), do: [h1 + h2 | sum_pairs(t)]

  def even_length?([]), do: true

  def even_length?([_head | tail]) do
    !even_length?(tail)
  end
end
