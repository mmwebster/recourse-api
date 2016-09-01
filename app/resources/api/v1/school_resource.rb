class Api::V1::SchoolResource < JSONAPI::Resource
  attributes :title
  has_many :courses
  has_many :students
  has_many :admins
  has_many :nodes
  has_many :degree_majors
  has_many :degree_minors
end
