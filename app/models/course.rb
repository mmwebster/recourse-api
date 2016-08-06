class Course < ApplicationRecord
  belongs_to :school
  has_and_belongs_to_many :timelines, dependent: :destroy
  has_many :nodes, dependent: :destroy
  has_and_belongs_to_many :quarters
  has_many :concurrent_children, class_name: "Course",
           foreign_key: "concurrent_parent_id", dependent: :destroy
  belongs_to :concurrent_parent, class_name: "Course"
end
