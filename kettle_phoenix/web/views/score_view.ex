defmodule KettlePhoenix.ScoreView do
  use KettlePhoenix.Web, :view

  def render("index.json", %{scores: scores}) do
    %{data: render_many(scores, KettlePhoenix.ScoreView, "score.json")}
  end

  def render("show.json", %{score: score}) do
    %{data: render_one(score, KettlePhoenix.ScoreView, "score.json")}
  end

  def render("score.json", %{score: score}) do
    %{id: score.id,
      player: score.player,
      score: score.score}
  end
end
