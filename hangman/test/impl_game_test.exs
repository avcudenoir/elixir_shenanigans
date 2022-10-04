defmodule HangmanImplGameTest do
  use ExUnit.Case
  doctest Hangman

  alias Hangman.Impl.Game

  test "new game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing

    assert length(game.letters) > 0
  end

  test "new game returns correct word" do
    game = Game.new_game("wombat")

    assert game.letters == ["w", "o", "m", "b", "a", "t"]
  end

  test "new game letters are lowercase ascii" do
    game = Game.new_game()
    word = Enum.join(game.letters)
    # https://hexdocs.pm/elixir/Regex.html#module-character-classes
    assert String.match?(word, ~r/^[\\0-\x7f]+$/)
  end
end
