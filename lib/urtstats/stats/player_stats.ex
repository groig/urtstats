defmodule Urtstats.Stats.PlayerStats do
  use Ecto.Schema

  schema "xlr_playerstats" do
    field :kills, :integer
    field :deaths, :integer
    field :teamkills, :integer
    field :teamdeaths, :integer
    field :suicides, :integer
    field :ratio, :decimal
    field :skill, :decimal
    field :assists, :integer
    field :curstreak, :integer
    field :winstreak, :integer
    field :losestreak, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :client_id
  end
end
