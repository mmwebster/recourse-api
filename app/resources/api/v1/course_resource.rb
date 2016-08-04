class Api::V1::CourseResource < JSONAPI::Resource
  attributes :title, :created_at, :subject, :number, :units, :season_fall,
             :season_winter, :season_spring, :total_units
end
