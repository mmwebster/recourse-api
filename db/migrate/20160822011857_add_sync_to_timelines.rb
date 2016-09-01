class AddSyncToTimelines < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :sync, :boolean
  end
end
