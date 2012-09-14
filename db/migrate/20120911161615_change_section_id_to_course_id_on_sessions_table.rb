class ChangeSectionIdToCourseIdOnSessionsTable < ActiveRecord::Migration
  def change
    rename_column :sessions, :section_id, :course_id
  end
end
