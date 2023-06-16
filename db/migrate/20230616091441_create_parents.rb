# frozen_string_literal: true

class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :email
      t.string :phone
      t.string :password
      t.string :name

      t.timestamps
    end
  end
end
