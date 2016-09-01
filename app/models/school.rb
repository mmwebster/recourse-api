class School < ApplicationRecord
  has_many :nodes, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :students
  has_many :admins
  has_many :degree_majors, dependent: :destroy
  has_many :degree_minors, dependent: :destroy
end
