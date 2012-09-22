class RemoveReferencablesTable < ActiveRecord::Migration
  def up
    drop_table "referencables"
  end

  def down
    create_table "referencables", :force => true do |t|
      t.integer  "author_id"
      t.integer  "reference_id"
      t.datetime "created_at",   :null => false
      t.datetime "updated_at",   :null => false
    end

    add_index "referencables", ["author_id"], :name => "index_referencables_on_author_id"
    add_index "referencables", ["reference_id", "author_id"], :name => "index_referencables_on_reference_id_and_author_id", :unique => true
    add_index "referencables", ["reference_id"], :name => "index_referencables_on_reference_id"
  end
end
