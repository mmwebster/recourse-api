class AddSchoolRefToNodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :nodes, :school, foreign_key: true
  end
end
