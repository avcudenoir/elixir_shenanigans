defmodule FizzBuzz do
  def fizzbuzz_non_repeating(x) do
    case {rem(x, 3), rem(x, 5)} do
      {0, 0} ->
        "FizzBuzz"

      {0, _} ->
        "Fizz"

      {_, 0} ->
        "Buzz"

      {_, _} ->
        x
    end
  end

  def fizzbuzz_repeating(x) do
    fizz_3 = fn x ->
      if rem(x, 3) == 0 do
        "Fizz"
      end
    end

    fizz_5 = fn x ->
      if rem(x, 5) == 0 do
        "Buzz"
      end
    end

    fizz_35 = fn x ->
      if rem(x, 3) == 0 and rem(x, 5) == 0 do
        "FizzBuzz"
      end
    end

    [fizz_3.(x), fizz_5.(x), fizz_35.(x)]
    |> Enum.join("")
    |> String.replace(~r"^$", Integer.to_string(x))
  end

  def run do
    IO.inspect(Enum.map(1..15, &fizzbuzz_non_repeating/1))
    IO.inspect(Enum.map(1..15, &fizzbuzz_repeating/1))
  end
end

FizzBuzz.run()
