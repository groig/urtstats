defmodule UrtstatsWeb.PageController do
  use UrtstatsWeb, :controller

  def index(conn, _params) do
    players = Urtstats.top_players()
    current_map = Urtstats.get_current_map()
    current_game_type = Urtstats.get_current_gametype()
    current_clients = Urtstats.all_clients()
    render(conn, "index.html",
      players: players,
      current_map: current_map.value,
      current_game_type: current_game_type.value,
      current_clients: current_clients
    )
  end

  def players(conn, _params) do
    players = Urtstats.all_players()
    render(conn, "players.html", players: players)
  end

  def player(conn, %{"id" => id} = _params) do
    player = Urtstats.player(id)
    render(conn, "player.html", player: player)
  end

  def weapons(conn, _params) do
    weapons = Urtstats.all_weapons()
    render(conn, "weapons.html", weapons: weapons)
  end

  def maps(conn, _params) do
    maps = Urtstats.all_maps()
    render(conn, "maps.html", maps: maps)
  end

  def penalties(conn, _params) do
    penalties = Urtstats.all_penalties()
    render(conn, "penalties.html", penalties: penalties)
  end

  def donate(conn, _params) do
    render(conn, "donate.html")
  end
end
