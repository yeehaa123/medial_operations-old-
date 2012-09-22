class AddTitlePrefixToCourses < ActiveRecord::Migration

  def up
    remove_column :courses, :full_title
    add_column :courses, :title_prefix, :string
  end

  def down
    remove_column :courses, :title_prefix
    add_column :courses, :full_title, :string
  end
end
