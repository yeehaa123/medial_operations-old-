class ChangeCourseShortTitleToTitle < ActiveRecord::Migration
  def change
    rename_column :courses, :short_title, :title
  end
end
