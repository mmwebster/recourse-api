class CreateJoinTableDegreeMinorsTimelines < ActiveRecord::Migration[5.0]
  def change
    create_join_table :degree_minors, :timelines do |t|
      t.index :degree_minor_id
      t.index :timeline_id
      # t.index [:degree_minor_id, :timeline_id]
      # t.index [:timeline_id, :degree_minor_id]
    end
  end
end
