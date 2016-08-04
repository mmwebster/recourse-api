class Api::V1::QuarterResource < JSONAPI::Resource
  attributes :season, :start_date
  has_one :timeline
end
