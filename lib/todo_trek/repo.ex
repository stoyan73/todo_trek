defmodule TodoTrek.Repo do
  use Ecto.Repo,
    otp_app: :todo_trek,
    adapter: Ecto.Adapters.Postgres
end
