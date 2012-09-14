class ChangeSectionTableToCourseSection < ActiveRecord::Migration
  def change
    rename_table :sections, :course_sections
  end
end
