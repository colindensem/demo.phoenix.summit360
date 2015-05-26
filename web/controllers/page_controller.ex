defmodule Summit360Www.PageController do
  use Summit360Www.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html", page: ""
  end


  def show(conn, %{"page" => page}) do
    conn
    |> render "#{page}.html", page: page
  end


end
