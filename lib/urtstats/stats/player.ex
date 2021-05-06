defmodule Urtstats.Stats.Player do
  use Ecto.Schema

  schema "clients" do
    field :name, :string
    has_one :stats, Urtstats.Stats.PlayerStats, foreign_key: :client_id
  end
end
