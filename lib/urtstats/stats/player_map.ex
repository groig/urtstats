defmodule Urtstats.Stats.PlayerMap do
  use Ecto.Schema

  schema "xlr_playermaps" do
    field :kills, :integer
    field :deaths, :integer
    field :teamkills, :integer
    field :teamdeaths, :integer
    field :suicides, :integer
    field :rounds, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :player_id
    belongs_to :map, Urtstats.Stats.Map, foreign_key: :map_id
  end
end
