class AddDateTimeAndLocationToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :date, :date
    add_column :sessions, :start_time, :time
    add_column :sessions, :end_time, :time
    add_column :sessions, :location, :string
  end
end
