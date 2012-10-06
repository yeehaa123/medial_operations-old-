class RenameColumnFromReferenceIdToMagazineReferenceId < ActiveRecord::Migration
  def change
    rename_column :magazine_publisheds, :reference_id, :magazine_article_reference_id
  end
end
