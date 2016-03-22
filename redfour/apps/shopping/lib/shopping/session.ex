defmodule Redfour.Shopping.Session do
  use GenServer

  defstruct [
    domain: nil,
    id: nil,
    key: nil,
    landing: "/",
    ip: "127.0.0.1",
    member_id: nil,
    items: [],
    logs: [],
    discounts: []
  ]

  def start_link(%{key: key} = args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(%{key: key} = args) do
    struct(%Redfour.Shopping.Session{}, args)
  end

   # public API
  def select_item(pid, item),  do: GenServer.call(pid, {:select_item, item})

  def remove_item(pid, sku: sku),  do: GenServer.call(pid, {:remove_item, sku: sku})

  def change_item(pid, sku: sku),  do: GenServer.call(pid, {:change_item, sku: sku})

   # internal GenServer bits
  def handle_call({:select_item, item}, _sender, session) do
    session = %{session | items: List.insert_at(session.items, -1, item)}
    {:reply, session, session}
  end
  def handle_call({:remove_item, sku: sku}, _sender, session) do

  end
  def handle_call({:change_item, sku: sku}, _sender, session) do

  end

end
