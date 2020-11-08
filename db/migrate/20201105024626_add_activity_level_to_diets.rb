class AddActivityLevelToDiets < ActiveRecord::Migration[6.0]
  def change
    add_column :diets, :activity_level, :integer
  end
end
