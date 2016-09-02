class Api::V1::DegreeMinorResource < JSONAPI::Resource
  attributes :title, :tree
  has_one :school
  has_one :user
  has_many :timelines
end
