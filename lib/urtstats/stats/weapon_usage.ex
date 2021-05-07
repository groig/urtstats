defmodule Urtstats.Stats.WeaponUsage do
  use Ecto.Schema

  schema "xlr_weaponusage" do
    field :kills, :integer
    field :deaths, :integer
    field :teamkills, :integer
    field :teamdeaths, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :player_id
    belongs_to :weapon, Urtstats.Stats.Weapon, foreign_key: :weapon_id
  end
end
