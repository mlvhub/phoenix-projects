ExUnit.start

Mix.Task.run "ecto.create", ~w(-r CalidMedia.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r CalidMedia.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(CalidMedia.Repo)

