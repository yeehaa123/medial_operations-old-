class AddPublishedIdAndTypeToPublishers < ActiveRecord::Migration
  def change
    change_table :publishers do |t|
      t.integer  :published_id
      t.string   :published_type
    end
    add_index :publishers, :published_id
    add_index :publishers, [:published_id, :published_type]
  end
end
