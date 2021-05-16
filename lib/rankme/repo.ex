defmodule Rankme.Repo do
  use Ecto.Repo,
    otp_app: :rankme,
    adapter: Ecto.Adapters.Postgres
end
