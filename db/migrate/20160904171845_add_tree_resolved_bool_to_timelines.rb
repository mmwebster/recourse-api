class AddTreeResolvedBoolToTimelines < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :tree_resolved, :boolean, null: false, default: false
  end
end
