class CreateJoinTableDegreeMajorsTimelines < ActiveRecord::Migration[5.0]
  def change
    create_join_table :degree_majors, :timelines do |t|
      t.index :degree_major_id
      t.index :timeline_id
      # t.index [:degree_major_id, :timeline_id]
      # t.index [:timeline_id, :degree_major_id]
    end
  end
end
