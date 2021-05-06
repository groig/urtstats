defmodule Urtstats.Repo do
  use Ecto.Repo,
    otp_app: :urtstats,
    adapter: Ecto.Adapters.Postgres
end
