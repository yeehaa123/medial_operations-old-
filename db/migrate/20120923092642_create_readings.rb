class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :reference_id
      t.integer :session_id

      t.timestamps
    end
    add_index :readings, :reference_id
    add_index :readings, :session_id
    add_index :readings, [:reference_id, :session_id], unique: true
  end
end
