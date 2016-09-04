class Api::V1::TimelineResource < JSONAPI::Resource
  attributes :title, :starting_season, :is_current, :sync, :tree, :tree_resolved
  has_many :quarters
  has_many :courses
  has_many :degree_majors
  has_many :degree_minors
  has_one :user
end
