class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :title
      t.date :date
      t.string :medium

      t.timestamps
    end
  end
end
