defmodule Urtstats.Stats.Client do
  use Ecto.Schema

  schema "current_clients" do
    field :name, :string
    field :score, :integer
  end
end
