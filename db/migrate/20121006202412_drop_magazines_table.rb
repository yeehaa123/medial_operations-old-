class DropMagazinesTable < ActiveRecord::Migration
  def up
    drop_table :magazines
  end

  def down
    create_table "magazines", :force => true do |t|
      t.string   "name"
      t.datetime "created_at",   :null => false
      t.datetime "updated_at",   :null => false
      t.integer  "publisher_id"
    end

    add_index "magazines", ["publisher_id"], :name => "index_magazines_on_publisher_id"
  end
end
