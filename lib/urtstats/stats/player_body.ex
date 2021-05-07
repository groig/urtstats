defmodule Urtstats.Stats.PlayerBody do
  use Ecto.Schema

  schema "xlr_playerbody" do
    field :bodypart_id, :integer
    field :kills, :integer
    field :deaths, :integer
    field :teamkills, :integer
    field :teamdeaths, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :player_id
  end
end
