class AddIndexesToSessionsTable < ActiveRecord::Migration
  def change
    add_index :sessions, :course_id
    add_index :sessions, :section_id
  end
end
