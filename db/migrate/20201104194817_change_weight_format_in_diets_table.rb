class ChangeWeightFormatInDietsTable < ActiveRecord::Migration[6.0]
  def change
    change_column :diets, :current_weight, :integer
    change_column :diets, :target_weight, :integer
  end
end
