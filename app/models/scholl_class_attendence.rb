# frozen_string_literal: true

class SchollClassAttendence < ApplicationRecord
  belongs_to :school_class
  belongs_to :attendence
end
