class DegreeMinor < ApplicationRecord
  belongs_to :school
  belongs_to :student
  has_and_belongs_to_many :timelines
end
