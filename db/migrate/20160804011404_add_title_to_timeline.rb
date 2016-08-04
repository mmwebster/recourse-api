class AddTitleToTimeline < ActiveRecord::Migration[5.0]
  def change
    add_column :timelines, :title, :string
  end
end
