class AddForeignKeyToReferences < ActiveRecord::Migration
  def change
    add_column :references, :type_id, :integer
    add_index :references, :type_id
  end
end
