# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TodoTrek.Repo.insert!(%TodoTrek.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TodoTrek.Accounts

{:ok, user} =
  Accounts.register_user(%{
    email: "user@abv.bg",
    password: "passw@rd1234"
  })
