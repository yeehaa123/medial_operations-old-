class CreateCitedWorks < ActiveRecord::Migration
  def change
    create_table :cited_works do |t|
      t.integer :reference_id
      t.integer :article_id

      t.timestamps
    end
    add_index :cited_works, :reference_id
    add_index :cited_works, :article_id
    add_index :cited_works, [:reference_id, :article_id], unique: true
  end
end