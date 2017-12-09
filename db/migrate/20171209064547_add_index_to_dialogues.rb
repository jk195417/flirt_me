class AddIndexToDialogues < ActiveRecord::Migration[5.1]
  def change
    add_index :dialogues, :likes
    add_index :dialogues, :dislikes
  end
end
