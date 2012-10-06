class RemoveTypeAndIdFromPublishers < ActiveRecord::Migration
  def up
    remove_column :publishers, :published_id
    remove_column :publishers, :published_type
  end

  def down
    add_column :publishers, :published_id
    add_colum :publishers,  :published_type
    add_index "publishers", ["published_id", "published_type"], :name => "index_publishers_on_published_id_and_published_type"
    add_index "publishers", ["published_id"], :name => "index_publishers_on_published_id"
    end
end
