class AddTimelineRefToQuarters < ActiveRecord::Migration[5.0]
  def change
    add_reference :quarters, :timeline, foreign_key: true
  end
end
