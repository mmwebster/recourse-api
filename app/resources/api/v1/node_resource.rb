class Api::V1::NodeResource < JSONAPI::Resource
  attributes :title
  has_one :school
  has_one :course
end
