class AddNumberToSection < ActiveRecord::Migration
  def change
    add_column :sections, :number, :integer
  end
end
