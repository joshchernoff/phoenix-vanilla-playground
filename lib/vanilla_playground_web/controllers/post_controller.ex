defmodule VanillaPlaygroundWeb.PostController do
  use VanillaPlaygroundWeb, :controller

  alias VanillaPlayground.Blog

  def index(conn, _params) do
    posts = Blog.list_posts()
    render(conn, :index, posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post!(id)
    render(conn, :show, post: post)
  end
end
