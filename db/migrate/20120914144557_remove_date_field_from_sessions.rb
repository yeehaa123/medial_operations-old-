class RemoveDateFieldFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :date
  end

  def down
    add_column :sessions, :date, :date
  end
end
