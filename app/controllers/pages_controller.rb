class PagesController < ApplicationController
  def index
    @top_dialogues = {
      likes: Dialogue.order(likes: :desc).first(5),
      dislikes: Dialogue.order(dislikes: :desc).first(5)
    }
  end
end
