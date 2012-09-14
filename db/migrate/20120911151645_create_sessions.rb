class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.integer :number
      t.text :description
      t.integer :section_id

      t.timestamps
    end
  end
end
