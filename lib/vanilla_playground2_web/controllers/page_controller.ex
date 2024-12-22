defmodule VanillaPlayground2Web.PageController do
  use VanillaPlayground2Web, :controller

  def home(conn, _params) do
    render(conn, :home, test_list: [1, 2, 3, 4])
  end
end
