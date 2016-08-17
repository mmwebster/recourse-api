class Api::V1::UserResource < JSONAPI::Resource
  attributes :id, :email, :created_at, :updated_at, :password,
             :password_confirmation, :sign_in_count, :name_first, :name_last
  has_many :timelines
  has_many :degree_majors
  has_many :degree_minors
  has_one :school

  # def full_name
  #   if @model.name_first.empty? or @model.name_last.empty?
  #     return "Plaborius Plumbus"
  #   else
  #     return "#{@model.name_first} #{@model.name_last}"
  #   end
  # end
end
