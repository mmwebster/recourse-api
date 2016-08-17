class AddUserRefToDegreeMajors < ActiveRecord::Migration[5.0]
  def change
    add_reference :degree_majors, :user, foreign_key: true
  end
end
