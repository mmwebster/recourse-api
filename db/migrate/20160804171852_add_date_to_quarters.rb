class AddDateToQuarters < ActiveRecord::Migration[5.0]
  def change
    add_column :quarters, :start_date, :date
  end
end
