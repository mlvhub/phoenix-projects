defmodule CalidMedia.PageController do
  use CalidMedia.Web, :controller

  @media_dir "./priv/static/videos"
  @file_types [".mp4", ".mp3"]

  def index(conn, _params) do
    {:ok, files} = File.ls(@media_dir)
    filtered_files = Enum.filter(files, &valid_file/1)
    render conn, "index.html", files: filtered_files
  end

  def show(conn, %{"file" => file}) do
    IO.inspect "FILE"
    IO.inspect file
    render conn, "show.html", file: file
  end

  defp valid_file(file) do
    file |> String.ends_with?(@file_types)
  end

end
