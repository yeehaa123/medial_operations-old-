class CreatePeriodicals < ActiveRecord::Migration
  def change
    create_table :periodicals do |t|
      t.string :name
      t.integer :publisher_id
      t.string :type

      t.timestamps
    end
    add_index :periodicals, :publisher_id
  end
end
