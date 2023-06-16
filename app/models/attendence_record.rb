# frozen_string_literal: true

class AttendenceRecord < ApplicationRecord
  belongs_to :attendence
  belongs_to :student
end
