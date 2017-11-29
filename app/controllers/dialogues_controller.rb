class DialoguesController < ApplicationController
  before_action :set_dialogue, only: %i[show]

  def index
    @dialogues = Dialogue.all
  end

  def show; end

  private

  def set_dialogue
    @dialogue = Dialogue.find(params[:id])
  end
end
