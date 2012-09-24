class CreatePublisheds < ActiveRecord::Migration
  def change
    create_table :publisheds do |t|
      t.integer :publisher_id
      t.integer :reference_id

      t.timestamps
    end
    add_index :publisheds, :publisher_id
    add_index :publisheds, :reference_id
    add_index :publisheds, [:publisher_id, :reference_id], unique: true
  end
end
