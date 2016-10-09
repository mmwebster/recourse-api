class Api::V1::CourseResource < JSONAPI::Resource
  attributes :title, :created_at, :subject, :number, :units, :season_fall,
             :season_winter, :season_spring, :total_units, :tree
  has_many :timelines
  has_many :nodes
  has_many :quarters
  has_many :concurrent_children
  has_many :students
  has_one :concurrent_parent
  has_one :school

  paginator :paged

  # def meta(options)
  #   {
  #     total_pages: 10
  #     # copyright: 'API Copyright 2015 - XYZ Corp.',
  #     # computed_copyright: options[:serialization_options][:copyright],
  #     # last_updated_at: _model.updated_at
  #   }
  # end

end
