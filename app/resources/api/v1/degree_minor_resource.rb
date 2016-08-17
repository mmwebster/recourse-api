class Api::V1::DegreeMinorResource < JSONAPI::Resource
  attributes :title
  has_one :school
end
