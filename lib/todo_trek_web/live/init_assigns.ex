defmodule TodoTrekWeb.InitAssigns do
  @moduledoc """
  Ensures common `assigns` are applied to all LiveViews attaching this hook.
  """
  import Phoenix.LiveView
  import Phoenix.Component
  alias TodoTrek.Accounts

  def on_mount(:default, _params, _session, socket) do
    {:cont, assign(socket, :page_title, "Index page")}
  end

  def on_mount(:todo, _params, _session, socket) do
    {:cont, assign(socket, :page_title, "Todo Trek")}
  end

  def on_mount(:user, _params, _session, socket) do
    {:ok, socket}
  end

  def on_mount(:admin, _params, _session, socket) do
    {:ok, socket}
  end
end
