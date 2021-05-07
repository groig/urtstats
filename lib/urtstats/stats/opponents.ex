defmodule Urtstats.Stats.Oponents do
  use Ecto.Schema

  schema "xlr_opponents" do
    field :kills, :integer
    belongs_to :target, Urtstats.Stats.Player, foreign_key: :target_id
    belongs_to :killer, Urtstats.Stats.Player, foreign_key: :killer_id
  end
end
