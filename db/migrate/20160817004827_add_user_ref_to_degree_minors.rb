class AddUserRefToDegreeMinors < ActiveRecord::Migration[5.0]
  def change
    add_reference :degree_minors, :user, foreign_key: true
  end
end
