class Api::V1::UserResource < JSONAPI::Resource
  attributes :email, :created_at, :updated_at, :full_name
  has_many :timelines
  has_one :school

  def full_name
    "#{@model.name_first} #{@model.name_last}"
  end
end
