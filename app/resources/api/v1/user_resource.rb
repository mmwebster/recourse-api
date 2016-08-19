class Api::V1::UserResource < JSONAPI::Resource
  attributes :id, :email, :created_at, :updated_at, :password,
             :password_confirmation, :sign_in_count, :name_first, :name_last
  has_many :timelines
  has_many :degree_majors
  has_many :degree_minors
  has_one :school
  has_many :courses
end
