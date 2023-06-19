# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :school_classes
end
