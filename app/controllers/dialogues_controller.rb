class DialoguesController < ApplicationController
  before_action :set_dialogue, only: %i[show]

  def index
    @dialogues = Dialogue.order(:id).page(params[:page]).per(10)
  end

  def show
    @sentences = @dialogue.sentences.to_flirt_me_struct
  end

  private

  def set_dialogue
    @dialogue = Dialogue.find(params[:id])
  end
end
