# frozen_string_literal: true

class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences, &:timestamps
  end
end
