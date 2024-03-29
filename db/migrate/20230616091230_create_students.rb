# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :password

      t.timestamps
    end
  end
end
