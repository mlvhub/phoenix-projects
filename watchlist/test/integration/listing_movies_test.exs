defmodule ListingMoviesIntegrationTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Watchlist.Router
  alias Watchlist.Movie
  alias Watchlist.Repo

  @opts Router.init([])
  test "listing movies" do

    movie = %Movie{name: "Back to the future", rating: 5} |> Repo.insert!
    movies = Repo.all(Movie)
              |> Poison.encode!

    conn = conn(:get, "/api/movies")
    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == movies
  end

end
