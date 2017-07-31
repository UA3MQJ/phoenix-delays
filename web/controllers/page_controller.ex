defmodule PhDelay.PageController do
  use PhDelay.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
