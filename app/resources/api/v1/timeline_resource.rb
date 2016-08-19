class Api::V1::TimelineResource < JSONAPI::Resource
  attributes :title, :starting_season, :is_current
  has_many :quarters
  has_many :courses
  has_one :user
end
