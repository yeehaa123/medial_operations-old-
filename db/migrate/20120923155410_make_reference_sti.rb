class MakeReferenceSti < ActiveRecord::Migration
  def change
    add_column :references, :type, :string
  end
end
