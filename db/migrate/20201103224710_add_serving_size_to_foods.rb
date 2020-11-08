class AddServingSizeToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :serving_size, :integer
  end
end
