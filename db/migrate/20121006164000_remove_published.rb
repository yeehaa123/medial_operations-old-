class RemovePublished < ActiveRecord::Migration
  def up
    drop_table :publisheds
  end

  def down
    create_table "publisheds", :force => true do |t|
      t.integer  "publisher_id"
      t.integer  "reference_id"
      t.datetime "created_at",   :null => false
      t.datetime "updated_at",   :null => false
    end
    add_index "publisheds", ["publisher_id", "reference_id"], :name => "index_publisheds_on_publisher_id_and_reference_id", :unique => true
    add_index "publisheds", ["publisher_id"], :name => "index_publisheds_on_publisher_id"
    add_index "publisheds", ["reference_id"], :name => "index_publisheds_on_reference_id"
  end
end
