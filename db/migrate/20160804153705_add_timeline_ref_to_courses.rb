class AddTimelineRefToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :timeline, foreign_key: true
  end
end
