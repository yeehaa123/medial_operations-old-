class ChangeSessionNameToTitle < ActiveRecord::Migration
  def change
    rename_column :sessions, :name, :title
  end
end
