class CreateDialogues < ActiveRecord::Migration[5.1]
  def change
    create_table :dialogues do |t|
      t.string :title
      t.string :source
      t.integer :likes
      t.integer :dislikes
      t.references :user
      t.timestamps
    end
  end
end
