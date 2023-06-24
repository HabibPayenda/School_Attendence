# frozen_string_literal: true

class SchoolClass < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
  has_many :students, dependent: :destroy
  has_many :scholl_class_attendences, dependent: :destroy
  has_many :attendences, through: :scholl_class_attendences, dependent: :destroy
end
