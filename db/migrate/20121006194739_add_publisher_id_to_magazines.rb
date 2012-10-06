class AddPublisherIdToMagazines < ActiveRecord::Migration
  def change
    add_column :magazines, :publisher_id, :integer
    add_index :magazines, :publisher_id
  end
end
