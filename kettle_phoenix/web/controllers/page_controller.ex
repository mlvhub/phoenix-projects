defmodule KettlePhoenix.PageController do
  use KettlePhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
