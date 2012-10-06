class DropMagazinePublished < ActiveRecord::Migration
  def up
    drop_table :magazine_publisheds
  end

  def down
    create_table "magazine_publisheds", :force => true do |t|
    t.integer  "magazine_id"
    t.integer  "magazine_article_reference_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "magazine_publisheds", ["magazine_article_reference_id"], :name => "index_magazine_publisheds_on_reference_id"
  add_index "magazine_publisheds", ["magazine_id", "magazine_article_reference_id"], :name => "index_magazine_publisheds_on_magazine_id_and_reference_id", :unique => true
  add_index "magazine_publisheds", ["magazine_id"], :name => "index_magazine_publisheds_on_magazine_id"
  end
end
