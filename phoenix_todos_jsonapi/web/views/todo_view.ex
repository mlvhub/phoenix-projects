defmodule PhoenixTodosJsonapi.TodoView do
  use PhoenixTodosJsonapi.Web, :view

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, PhoenixTodosJsonapi.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, PhoenixTodosJsonapi.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      title: todo.title,
      is_completed: todo.is_completed}
  end
end
