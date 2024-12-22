defmodule VanillaPlayground.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `VanillaPlayground.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        likes: 42,
        title: "some title"
      })
      |> VanillaPlayground.Blog.create_post()

    post
  end
end
