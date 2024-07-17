defmodule LivePoll.PollsContext.Polls do
  use Ecto.Schema
  import Ecto.Changeset

  schema "polls" do
    field :name, :string
    field :opt1_name, :string
    field :opt2_name, :string
    field :opt1_votes, :integer, default: 0
    field :opt2_votes, :integer, default: 0
    field :users_who_voted, {:array, :string}, default: []
  end

  def changeset(polls, params \\ %{}) do
    polls
    # pega dados externos e os converte por meio do cast para que possamos fazer a validação
    |> cast(params, [:name, :opt1_name, :opt1_votes, :opt2_name, :opt2_votes])
    |> validate_required([:name, :opt1_name, :opt1_votes, :opt2_name, :opt2_votes])
  end
end
