class School < ApplicationRecord
  has_many :nodes, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :users
end
