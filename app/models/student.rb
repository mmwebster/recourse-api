class Student < User
  has_many :timelines, dependent: :destroy, foreign_key: 'user_id'
  has_many :degree_majors, foreign_key: 'user_id'
  has_many :degree_minors, foreign_key: 'user_id'
  has_many :courses, foreign_key: 'user_id'
end
