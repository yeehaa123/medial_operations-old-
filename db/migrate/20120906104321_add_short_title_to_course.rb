class AddShortTitleToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :short_title, :string
    rename_column :courses, :title, :full_title
  end
end
