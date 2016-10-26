class AddIsStaticColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_static, :boolean
  end
end
