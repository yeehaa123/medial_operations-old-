class AddSectionIdToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :section_id, :integer
  end
end
