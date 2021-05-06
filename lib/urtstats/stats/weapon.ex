defmodule Urtstats.Stats.Weapon do
  use Ecto.Schema

  schema "xlr_weaponstats" do
    field :name, :string
    field :kills, :integer
    field :teamkills, :integer
    field :suicides, :integer
  end
end
