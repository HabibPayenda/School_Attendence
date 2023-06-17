# frozen_string_literal: true

class Attendence < ApplicationRecord
  has_many :attendence_records
  has_many :scholl_class_attendences
end
