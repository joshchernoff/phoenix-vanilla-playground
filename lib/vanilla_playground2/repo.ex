defmodule VanillaPlayground2.Repo do
  use Ecto.Repo,
    otp_app: :vanilla_playground2,
    adapter: Ecto.Adapters.SQLite3
end
