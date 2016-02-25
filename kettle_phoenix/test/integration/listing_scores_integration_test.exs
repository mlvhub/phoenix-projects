defmodule KettlePhoenix.ListingScoresIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias KettlePhoenix.Router
  alias KettlePhoenix.Score
  alias KettlePhoenix.Repo

  @opts Router.init([])
  test 'listing movies' do
    score = %Score{player: "Back to the future", score: 5}
            |> Repo.insert!

    conn = conn(:get, "/api/scores")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == score
  end
end
