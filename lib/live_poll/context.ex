defmodule LivePoll.PollsContext.Context do
  alias LivePoll.Repo
  alias LivePoll.PollsContext.Polls

  # adicionando ao banco de dados, vai no changeset fazer validação
  def create_poll(attrs) do
    Polls.changeset(%Polls{}, attrs)
    |> Repo.insert()
  end

  # resgata todas as polls do banco de dados
  def list_polls() do
    Polls |> Repo.all()
  end

  def remove_poll(%Polls{} = poll) do
    Repo.delete(poll)
  end

  def add_vote(%Polls{} = poll, attrs) do
    IO.inspect(attrs)
    poll
    |> Polls.changeset(attrs)
    |> Repo.update()
  end

  def get_poll!(id) do
    Repo.get!(Polls, id)
  end
end
