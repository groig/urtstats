defmodule UrtstatsWeb.PageView do
  use UrtstatsWeb, :view

  def convert_date(-1),  do: "-"

  def convert_date(timestamp) do
    {:ok, datetime} = DateTime.from_unix(timestamp, :millisecond)
    datetime
  end
end
