class CreateJoinTableCoursesTimelines < ActiveRecord::Migration[5.0]
  def change
    create_join_table :courses, :timelines do |t|
      t.index :course_id
      t.index :timeline_id
    end
  end
end
