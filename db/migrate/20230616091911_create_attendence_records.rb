# frozen_string_literal: true

class CreateAttendenceRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :attendence_records do |t|
      t.references :attendence, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
