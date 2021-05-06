defmodule Urtstats.Stats.ServerVar do
  use Ecto.Schema
  
  schema "current_svars" do
    field :name, :string
    field :value, :string
  end
end
