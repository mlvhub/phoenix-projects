defmodule PhoenixTodosJsonapi.PageController do
  use PhoenixTodosJsonapi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
