class RenameSessionsColumnOnReadings < ActiveRecord::Migration
  def change
    rename_column :readings, :session_id, :meeting_id
  end
end
