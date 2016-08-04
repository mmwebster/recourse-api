class Api::V1::SchoolResource < JSONAPI::Resource
  attributes :title
  has_many :courses
  has_many :users
  has_many :nodes
end
