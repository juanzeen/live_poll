defmodule LivePoll.Repo.Migrations.CreatePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :name, :string, null: false
      add :opt1_name, :string, null: false
      add :opt2_name, :string, null: false
      add :opt1_votes, :integer, null: false
      add :opt2_votes, :integer, null: false
    end
  end
end
