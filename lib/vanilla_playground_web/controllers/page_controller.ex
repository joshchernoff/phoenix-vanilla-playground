defmodule VanillaPlaygroundWeb.PageController do
  use VanillaPlaygroundWeb, :controller

  def home(conn, _params) do
    render(conn, :home, test_list: [1, 2, 3, 4])
  end
end
