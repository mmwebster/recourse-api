class DropStudentsAndAdminsTables < ActiveRecord::Migration[5.0]
  def up
    drop_table :students
    drop_table :admins
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
