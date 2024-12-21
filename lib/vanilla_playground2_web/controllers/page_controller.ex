defmodule VanillaPlayground2Web.PageController do
  use VanillaPlayground2Web, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
