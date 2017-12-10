class ChangeDialogueLikeDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :dialogues, :likes, 0
    change_column_default :dialogues, :dislikes, 0
  end
end
