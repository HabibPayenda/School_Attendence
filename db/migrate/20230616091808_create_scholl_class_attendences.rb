# frozen_string_literal: true

class CreateSchollClassAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :scholl_class_attendences do |t|
      t.references :school_class, null: false, foreign_key: true
      t.references :attendence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
