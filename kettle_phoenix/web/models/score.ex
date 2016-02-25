defmodule KettlePhoenix.Score do
  use KettlePhoenix.Web, :model

  schema "scores" do
    field :player, :string
    field :score, :integer

    timestamps
  end

  @required_fields ~w(player score)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
