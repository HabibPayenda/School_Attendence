# frozen_string_literal: true

class DepartmentTeacher < ApplicationRecord
  belongs_to :department
  belongs_to :teacher
end
