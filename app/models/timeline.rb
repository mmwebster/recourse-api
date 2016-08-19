class Timeline < ApplicationRecord
  has_many :quarters, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :degree_minors
  has_and_belongs_to_many :degree_majors
  has_and_belongs_to_many :courses # for now, can't alias as completed_courses
  # has_and_belongs_to_many :completed_courses,
  #                         class_name: "Course",
  #                         foreign_key: "timelines_id",
  #                         association_foreign_key: "courses_id"
end
