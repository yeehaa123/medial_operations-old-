class RenameCourseSectionToSection < ActiveRecord::Migration
  def change
    rename_table :course_sections, :sections
  end
end
