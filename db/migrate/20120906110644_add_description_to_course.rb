class AddDescriptionToCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :description
    add_column :courses, :description, :text
  end
end
