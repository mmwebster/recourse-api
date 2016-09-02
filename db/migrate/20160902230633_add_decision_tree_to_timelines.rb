class AddDecisionTreeToTimelines < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :tree, :json
  end
end
