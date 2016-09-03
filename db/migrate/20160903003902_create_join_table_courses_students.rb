class CreateJoinTableCoursesStudents < ActiveRecord::Migration[5.0]
  def change
    create_join_table :courses, :users do |t|
      t.index :course_id
      t.index :user_id # maybe student_id?
    end
  end
end
