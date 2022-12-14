defmodule Dictionary.Runtime.Server do
  @type t :: pid()

  @me __MODULE__

  use Agent
  alias Dictionary.Impl.WordList

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    # optional code if we want to make it randomly fail
    # if :rand.uniform() < 0.33 do
    #   Agent.get(@me, fn _ -> exit(:boom) end)
    # end

    Agent.get(@me, &WordList.random_word/1)
  end
end
