defmodule ExploringMars.Repo do
  use Ecto.Repo,
    otp_app: :exploring_mars,
    adapter: Ecto.Adapters.Postgres
end
