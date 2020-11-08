class RemoveStatsColumnFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :start_date, :date
    remove_column :users, :end_inches, :date
    remove_column :users, :goal, :string
    remove_column :users, :starting_weight, :integer
    remove_column :users, :target_weight, :integer
  end
end
