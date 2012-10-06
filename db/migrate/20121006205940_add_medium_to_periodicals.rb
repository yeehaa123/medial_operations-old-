class AddMediumToPeriodicals < ActiveRecord::Migration
  def change
    add_column :periodicals, :medium, :string
  end
end
