class RemoveParentsIdFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_index :students, :parent_id
    remove_column :students, :parent_id, :integer
  end
end
