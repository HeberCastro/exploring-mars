defmodule ExploringMarsWeb.PageController do
  use ExploringMarsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
