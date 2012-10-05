class AddVolumeIssueIsbnAndUrlToReferences < ActiveRecord::Migration
  def change
    change_table  :references do |t|
      t.integer   :volume
      t.integer   :issue
      t.string    :isbn
      t.string    :url
    end
  end
end
