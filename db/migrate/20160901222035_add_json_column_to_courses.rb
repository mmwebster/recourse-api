class AddJsonColumnToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :tree, :json, null: false, default: {type: 'root', children: []}
  end
end
