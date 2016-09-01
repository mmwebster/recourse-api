class Api::V1::UserResource < JSONAPI::Resource
  attributes :id, :email, :created_at, :updated_at, :password,
             :password_confirmation, :sign_in_count, :name_first, :name_last
  has_one :school
end
