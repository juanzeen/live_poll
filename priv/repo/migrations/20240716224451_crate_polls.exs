defmodule LivePoll.Repo.Migrations.CratePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
    add :name, :string
    add :opt1_name, :string, null: false
    add :opt2_name, :string, null: false
    add :opt1_votes, :integer
    add :opt2_votes, :integer
    add :users_who_voted, {:array, :string}
    end
  end
end
