class AddPagesToReferences < ActiveRecord::Migration
  def change
    add_column :references, :pages, :string
  end
end
