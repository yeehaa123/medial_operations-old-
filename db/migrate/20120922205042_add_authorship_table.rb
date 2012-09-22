class AddAuthorshipTable < ActiveRecord::Migration
  def change       
    create_table :authorships do |t|
    t.integer :reference_id
    t.integer :author_id

    t.timestamps
  end
  add_index :authorships, :reference_id
  add_index :authorships, :author_id
  add_index :authorships, [:author_id, :reference_id], unique: true
  end
end
