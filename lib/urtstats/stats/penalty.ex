defmodule Urtstats.Stats.Penalty do
  use Ecto.Schema
  schema  "penalties" do
    field :type, :string
    field :duration, :integer 
    field :inactive, :integer
    field :reason, :string
    field :time_add, :integer
    field :time_expire, :integer
    belongs_to :player, Urtstats.Stats.Player, foreign_key: :client_id
  end
  
end
