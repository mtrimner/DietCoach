class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :foods, :meal_id, :true
  end
end
