defmodule TodoTrekWeb.TodoLive.Index do
  use TodoTrekWeb, :live_view

  def mount(_params, session, socket) do
    {
      :ok,
      assign(
        socket,
        session_id: session["live_socket_id"]
      )
    }
  end
end
