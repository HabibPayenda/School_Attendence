# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :school_classes, dependent: :destroy
end
