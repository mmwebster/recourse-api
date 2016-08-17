class CreateDegreeMinors < ActiveRecord::Migration[5.0]
  def change
    create_table :degree_minors do |t|
      t.string :title
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
