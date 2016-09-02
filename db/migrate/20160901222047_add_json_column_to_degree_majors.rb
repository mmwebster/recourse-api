class AddJsonColumnToDegreeMajors < ActiveRecord::Migration[5.0]
  def change
    add_column :degree_majors, :tree, :json, null: false, default: {type: 'root', children: []}
  end
end
