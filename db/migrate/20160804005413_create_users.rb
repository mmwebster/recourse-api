class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.timestamps
    end
  end
end
