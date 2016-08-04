class CreateTimelines < ActiveRecord::Migration[5.0]
  def change
    create_table :timelines do |t|
      t.string :starting_season

      t.timestamps
    end
  end
end
