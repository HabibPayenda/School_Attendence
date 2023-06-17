class AddStatusToAttendenceRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :attendence_records, :status, :string
  end
end
