# frozen_string_literal: true

class CreateSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.integer :room_number

      t.timestamps
    end
  end
end
