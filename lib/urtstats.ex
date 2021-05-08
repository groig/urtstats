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
  alias Urtstats.Stats.Penalty
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

  def player(player_id) do
    Repo.one(from p in Player, where: p.id == ^player_id)
    |> Repo.preload(:stats)
    |> Repo.preload([maps: [:map]])
    |> Repo.preload(:body_parts)
    |> Repo.preload([weapons: [:weapon]])
    |> Repo.preload([fragged: [:target]])
    |> Repo.preload([fragged_by: [:killer]])
  end

  def player_join(player_id) do
    Repo.one(
      from p in Player,
        where: p.id == ^player_id,
        inner_join: stats in assoc(p, :stats),
        inner_join: weapons in assoc(p, :weapons),
        inner_join: weapon in assoc(weapons, :weapon),
        inner_join: maps in assoc(p, :maps),
        inner_join: map in assoc(maps, :map),
        inner_join: body_parts in assoc(p, :body_parts),
        inner_join: fragged in assoc(p, :fragged),
        inner_join: target in assoc(fragged, :target),
        inner_join: fragged_by in assoc(p, :fragged_by),
        inner_join: killer in assoc(fragged_by, :killer),
        preload: [
          stats: stats,
          weapons: {weapons, weapon: weapon},
          maps: {maps, map: map},
          body_parts: body_parts,
          fragged: {fragged, target: target},
          fragged_by: {fragged_by, killer: killer}
        ]
    )
  end

  def all_penalties do
    Repo.all(Penalty) |> Repo.preload(:player)
  end

  def all_maps do
    Repo.all(from m in Map, order_by: [{:desc, m.kills}])
  end

  def all_weapons do
    Repo.all(from w in Weapon, order_by: [{:desc, w.kills}])
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
