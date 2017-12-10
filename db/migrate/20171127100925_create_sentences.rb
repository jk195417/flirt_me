class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.string :content
      t.string :type
      t.integer :sequence
      t.references :dialogue
      t.timestamps
    end
  end
end
