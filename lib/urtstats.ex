defmodule Urtstats do
  @moduledoc """
  Urtstats keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Urtstats.Stats.Player
  alias Urtstats.Stats.Map
  alias Urtstats.Stats.Weapon
  alias Urtstats.Stats.ServerVar
  alias Urtstats.Stats.Client
  alias Urtstats.Repo
  import Ecto.Query

  def top_players do
    Repo.all(
      from p in Player,
        where: p.name != "World",
        join: s in assoc(p, :stats),
        order_by: [{:desc, s.skill}],
        limit: 10
    )
    |> Repo.preload(:stats)
  end

  def all_players do
    Repo.all(
      from p in Player,
        where: p.name != "World",
        join: s in assoc(p, :stats),
        order_by: [{:desc, s.skill}]
    )
    |> Repo.preload(:stats)
  end

  def all_maps do
    Repo.all(Map)
  end

  def all_weapons do
    Repo.all(Weapon)
  end

  def get_current_map do
    Repo.one(from v in ServerVar, where: v.name == "Map")
  end

  def get_current_gametype do
    Repo.one(from v in ServerVar, where: v.name == "gameType")
  end

  def all_clients do
    Repo.all(Client)
  end
end
