defmodule Redfour.Shopping do
  use Application
  import Supervisor.Spec, warn: false

  def start(_type, _args) do
    #supervision goes here
    start_session_supervisor
    start_database
  end

  #define our parent supervisor
  def start_session_supervisor do
    #spec the session supervisor
    session_worker = worker(Redfour.Shopping.Session, [])
    Supervisor.start_link([session_worker], strategy: :simple_one_for_one, name: Redfour.SessionSupervisor)
  end

  def start_database do
    #start the supervised DB
    db_worker = worker(Redfour.Shopping.Db, [database: "redfour"])
    Supervisor.start_link [db_worker], strategy: :one_for_one
  end

  def start_session(key: key) when is_binary(key), do: raise "Please use an atom key"
  def start_session(key: key) when is_atom(key) do
    res = Supervisor.start_child(Redfour.SessionSupervisor, [%{key: key}])
  end

end
