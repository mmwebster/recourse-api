class Api::V1::StudentResource < Api::V1::UserResource
  has_many :degree_majors
  has_many :degree_minors
  has_many :courses
end
