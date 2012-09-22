class CreateReferencables < ActiveRecord::Migration
  def change
    create_table :referencables do |t|
      t.integer :reference_id
      t.integer :article_id

      t.timestamps
    end
    add_index :referencables, :reference_id
    add_index :referencables, :article_id
    add_index :referencables, [:article_id, :reference_id], unique: true
  end
end
