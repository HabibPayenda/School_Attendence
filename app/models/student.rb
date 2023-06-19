# frozen_string_literal: true

class Student < ApplicationRecord
  has_one :parent
  belongs_to :school_class
  has_one :department, through: :school_class
end
