defmodule Urtstats.Stats.Map do
  use Ecto.Schema

  schema "xlr_mapstats" do
    field :name, :string
    field :rounds, :integer
    field :kills, :integer
    field :teamkills, :integer
    field :suicides, :integer
  end
end
