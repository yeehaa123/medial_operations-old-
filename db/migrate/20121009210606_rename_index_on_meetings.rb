class RenameIndexOnMeetings < ActiveRecord::Migration
  def change
    rename_index :meetings, "index_sessions_on_course_id", "index_meetings_on_course_id"
    rename_index :meetings, "index_sessions_on_section_id", "index_meetings_on_section_id"
  end
end