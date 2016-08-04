class Api::V1::CourseResource < JSONAPI::Resource
  attributes :title, :created_at, :subject, :number, :units, :season_fall,
             :season_winter, :season_spring, :total_units
  has_many :timelines
  has_many :nodes
  has_many :quarters
  has_many :concurrent_children
  has_one :concurrent_parent
end
