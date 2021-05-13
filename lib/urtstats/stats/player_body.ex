defmodule Urtstats.Stats.PlayerBody do
  use Ecto.Schema

  @body_parts %{
    1 => "HEAD",
    2 => "HELMET",
    3 => "TORSO",
    4 => "VEST",
    5 => "ARM LEFT",
    6 => "ARM RIGHT",
    7 => "GROIN",
    8 => "BUTT",
    9 => "LEG UPPER LEFT",
    10 => "LEG UPPER RIGHT",
    11 => "LEG LOWER LEFT",
    12 => "LEG LOWER RIGHT",
    13 => "FOOT LEFT",
    14 => "FOOT RIGHT"
  }
  schema "xlr_playerbody" do
    field :bodypart_id, :integer
    field :kills, :integer
    field :deaths, :integer
    field :teamkills, :integer
    field :teamdeaths, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :player_id
  end

  def get_body_part_name(id) do
    Map.get(@body_parts, id, "UNIDENTIFIED")
  end
end
