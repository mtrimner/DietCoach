class FixColumnName < ActiveRecord::Migration[6.0]
  
  def change
    rename_column :diets, :starting_weight, :current_weight
  end

end
