defmodule KettlePhoenix.ScoreTest do
  use KettlePhoenix.ModelCase

  alias KettlePhoenix.Score

  @valid_attrs %{player: "some content", score: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Score.changeset(%Score{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Score.changeset(%Score{}, @invalid_attrs)
    refute changeset.valid?
  end
end
