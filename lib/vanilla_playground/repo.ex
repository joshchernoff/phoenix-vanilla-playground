defmodule VanillaPlayground.Repo do
  use Ecto.Repo,
    otp_app: :vanilla_playground,
    adapter: Ecto.Adapters.SQLite3
end
