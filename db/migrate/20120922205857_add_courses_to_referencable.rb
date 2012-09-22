class AddCoursesToReferencable < ActiveRecord::Migration
  def change
    add_column :referencables, :course_id, :integer
  end
end
