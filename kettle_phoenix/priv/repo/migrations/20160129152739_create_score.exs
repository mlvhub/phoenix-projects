defmodule KettlePhoenix.Repo.Migrations.CreateScore do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :player, :string
      add :score, :integer

      timestamps
    end

  end
end
