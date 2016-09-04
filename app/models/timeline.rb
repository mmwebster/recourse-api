class Timeline < ApplicationRecord
  has_many :quarters, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :degree_minors
  has_and_belongs_to_many :degree_majors
  # for now, unable to alias as completed_courses
  has_and_belongs_to_many :courses
end
