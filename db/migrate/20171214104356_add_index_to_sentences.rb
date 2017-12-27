class AddIndexToSentences < ActiveRecord::Migration[5.1]
  def change
    add_index :sentences, %i[type dialogue_id]
    add_index :sentences, %i[type dialogue_id sequence]
  end
end
