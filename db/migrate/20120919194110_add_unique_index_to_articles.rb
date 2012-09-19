class AddUniqueIndexToArticles < ActiveRecord::Migration
  def up
    remove_index :articles, :slug
    add_index :articles, :slug, :unique
  end

  def down
    remove_index :articles, :slug
    add_index :articles, :slug
  end
end
