class Student < User
  has_many :timelines, dependent: :destroy, foreign_key: 'user_id'
  has_many :degree_majors, foreign_key: 'user_id'
  has_many :degree_minors, foreign_key: 'user_id'
  has_and_belongs_to_many :courses, join_table: 'courses_users', association_foreign_key: 'course_id', foreign_key: 'user_id'
  belongs_to :school
end
