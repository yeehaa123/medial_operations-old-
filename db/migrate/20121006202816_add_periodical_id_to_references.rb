class AddPeriodicalIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :periodical_id, :integer
    add_index :references, :periodical_id
  end
end
