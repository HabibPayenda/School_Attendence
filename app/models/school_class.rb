# frozen_string_literal: true

class SchoolClass < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
  has_many :students
end
