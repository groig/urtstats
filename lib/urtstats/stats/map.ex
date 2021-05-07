defmodule Urtstats.Stats.Map do
  use Ecto.Schema

  schema "xlr_mapstats" do
    field :name, :string
    field :rounds, :integer
    field :kills, :integer
    field :teamkills, :integer
    field :suicides, :integer
    has_many :players, Urtstats.Stats.PlayerMap, foreign_key: :map_id
  end
end
