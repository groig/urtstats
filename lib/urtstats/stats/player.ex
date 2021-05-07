defmodule Urtstats.Stats.Player do
  use Ecto.Schema

  schema "clients" do
    field :name, :string
    has_one :stats, Urtstats.Stats.PlayerStats, foreign_key: :client_id
    has_many :maps, Urtstats.Stats.PlayerMap, foreign_key: :player_id
    has_many :body_parts, Urtstats.Stats.PlayerBody, foreign_key: :player_id
    has_many :weapons, Urtstats.Stats.WeaponUsage, foreign_key: :player_id
    has_many :fragged, Urtstats.Stats.Oponents, foreign_key: :killer_id
    has_many :fragged_by, Urtstats.Stats.Oponents, foreign_key: :target_id
  end
end
