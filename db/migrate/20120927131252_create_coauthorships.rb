class CreateCoauthorships < ActiveRecord::Migration
  def change
    create_table :coauthorships do |t|
      t.integer :author_id
      t.integer :reference_id

      t.timestamps
    end
    add_index :coauthorships, :author_id
    add_index :coauthorships, :reference_id
    add_index :coauthorships, [:author_id, :reference_id], unique: true
  end
end
