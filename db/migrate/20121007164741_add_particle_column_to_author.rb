class AddParticleColumnToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :particle, :string
  end
end
