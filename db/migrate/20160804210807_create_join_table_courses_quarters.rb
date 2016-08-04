class CreateJoinTableCoursesQuarters < ActiveRecord::Migration[5.0]
  def change
    create_join_table :courses, :quarters do |t|
      t.index :course_id
      t.index :quarter_id
    end
  end
end
