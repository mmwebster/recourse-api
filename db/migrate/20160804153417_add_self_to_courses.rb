class AddSelfToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :course, foreign_key: true
  end
end
