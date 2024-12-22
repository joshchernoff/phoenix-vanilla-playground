# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VanillaPlayground.Repo.insert!(%VanillaPlayground.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias VanillaPlayground.Blog

1..400
|> Enum.each(fn i ->
  Blog.create_post(%{title: "post #{i}", body: "asdfasdf asdfasdf asdf a", likes: 0})
end)
