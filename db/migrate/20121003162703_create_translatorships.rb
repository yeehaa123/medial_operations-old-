class CreateTranslatorships < ActiveRecord::Migration
  def change
    create_table :translatorships do |t|
      t.integer :author_id
      t.integer :reference_id

      t.timestamps
    end
    add_index :translatorships, :author_id
    add_index :translatorships, :reference_id
    add_index :translatorships, [:author_id, :reference_id], unique: true
  end
end
