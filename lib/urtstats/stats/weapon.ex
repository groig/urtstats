defmodule Urtstats.Stats.Weapon do
  use Ecto.Schema

  @weapons %{
    "1" => "WATER",
    "3" => "LAVA",
    "5" => "TELEFRAG",
    "6" => "FALLING",
    "mod_falling" => "FALLING",
    "7" => "SUICIDE",
    "9" => "TRIGGER_HURT",
    "10" => "CHANGE_TEAM",
    "12" => "KNIFE",
    "13" => "KNIFE_THROWN",
    "14" => "BERETTA",
    "15" => "DEAGLE",
    "16" => "SPAS",
    "17" => "UMP45",
    "18" => "MP5K",
    "19" => "LR300",
    "20" => "G36",
    "21" => "PSG1",
    "22" => "HK69",
    "23" => "BLED",
    "24" => "KICKED",
    "25" => "HEGRENADE",
    "28" => "SR8",
    "30" => "AK103",
    "31" => "SPLODED",
    "32" => "SLAPPED",
    "33" => "SMITED",
    "34" => "BOMBED",
    "35" => "NUKED",
    "36" => "NEGEV",
    "37" => "HK69_HIT",
    "38" => "M4",
    "39" => "GLOCK",
    "40" => "COLT1911",
    "41" => "MAC11",
    "42" => "FRF1",
    "43" => "BENELLI",
    "44" => "P90",
    "45" => "MAGNUM",
    "46" => "TOD50",
    "47" => "FLAG",
    "48" => "GOOMBA"
  }

  schema "xlr_weaponstats" do
    field :name, :string
    field :kills, :integer
    field :teamkills, :integer
    field :suicides, :integer
  end

  def get_weapon_name(id) do
    Map.get(@weapons, id)
  end
end
