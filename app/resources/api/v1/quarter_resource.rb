class Api::V1::QuarterResource < JSONAPI::Resource
  attributes :season, :start_date, :max_units
  has_one :timeline
  has_many :courses
end
