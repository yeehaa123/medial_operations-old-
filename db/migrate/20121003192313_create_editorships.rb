class CreateEditorships < ActiveRecord::Migration
  def change
    create_table :editorships do |t|
      t.integer :author_id
      t.integer :reference_id

      t.timestamps
    end
    add_index :editorships, :author_id
    add_index :editorships, :reference_id
    add_index :editorships, [:author_id, :reference_id], unique: true
  end
end
