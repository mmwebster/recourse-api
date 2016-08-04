class User < ApplicationRecord
  belongs_to :school
  has_many :timelines, dependent: :destroy
end
