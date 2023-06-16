# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.string :password

      t.timestamps
    end
  end
end
