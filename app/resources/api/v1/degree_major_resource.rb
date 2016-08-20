class Api::V1::DegreeMajorResource < JSONAPI::Resource
  attributes :title
  has_one :school
  has_one :user
  has_many :timelines
end
