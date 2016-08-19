class AddIsCurrentToTimelines < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :is_current, :boolean
  end
end
