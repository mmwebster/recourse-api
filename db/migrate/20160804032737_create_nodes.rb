class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :node_type
      t.integer :children_required
      t.string :node_goal_type
      t.string :node_course_parent_rel

      t.timestamps
    end
  end
end
