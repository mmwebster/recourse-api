class AddFinalColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :subject, :string
    add_column :courses, :number, :string
    add_column :courses, :title, :string
    add_column :courses, :units, :decimal
    add_column :courses, :season_fall, :boolean
    add_column :courses, :season_winter, :boolean
    add_column :courses, :season_spring, :boolean
    add_column :courses, :total_units, :decimal
  end
end
