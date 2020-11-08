class AddStartingWeightToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :starting_weight, :integer
  end
end
