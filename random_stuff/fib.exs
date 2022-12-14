defmodule Fibonacci do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end


defmodule FibCache do
  def start() do
    Agent.start_link(fn -> %{0 => 0, 1 => 1})
  end
end



{:ok, pid } = FibCache.start()
