class Course < ApplicationRecord
  belongs_to :school
  has_and_belongs_to_many :timelines, dependent: :destroy
  has_many :nodes, dependent: :destroy
  # has_many :quarters
  # has_many :concurrent_courses
end
