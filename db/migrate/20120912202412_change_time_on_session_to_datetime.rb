class ChangeTimeOnSessionToDatetime < ActiveRecord::Migration
  def change
    remove_column :sessions, :start_time
    remove_column :sessions, :end_time
  end
end
