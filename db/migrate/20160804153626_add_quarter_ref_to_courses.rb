class AddQuarterRefToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :quarter, foreign_key: true
  end
end
