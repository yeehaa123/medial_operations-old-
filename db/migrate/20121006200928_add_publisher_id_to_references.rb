class AddPublisherIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :publisher_id, :integer
    add_index :references, :publisher_id
  end
end
