# frozen_string_literal: true

class SchoolClass < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
  has_many :students
  has_many :scholl_class_attendences
  has_many :attendences, through: :scholl_class_attendences
end
