defmodule VanillaPlayground.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :title, :string
    field :body, :string
    field :likes, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :likes])
    |> validate_required([:title, :body, :likes])
  end
end
