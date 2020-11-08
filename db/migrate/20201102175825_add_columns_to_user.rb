class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :goal, :string
    add_column :users, :start_date, :date
    add_column :users, :end_date, :date
  end
end
