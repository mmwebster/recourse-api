class AddNodeRefToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :node, foreign_key: true
  end
end
