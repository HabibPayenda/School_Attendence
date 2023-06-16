# frozen_string_literal: true

class AddEmailAndPhoneNumberToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :email, :string
    add_column :admins, :phone_number, :string
  end
end
