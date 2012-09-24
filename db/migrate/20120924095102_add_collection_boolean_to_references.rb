class AddCollectionBooleanToReferences < ActiveRecord::Migration
  def change
    add_column :references, :collection, :boolean, default: false
    add_index :references, :collection
  end
end
