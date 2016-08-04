class AddConcurrentParentToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :concurrent_parent, index: true #, foreign_key: true
  end
end
