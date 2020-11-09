class CreateDaysTable < ActiveRecord::Migration[6.0]
  def change
    create_table :days_tables do |t|
      t.date :day
      t.boolean :goal_achieved, :default => false
      t.integer :diet_id
      t.integer :carbs_consumed
      t.integer :fat_consumed
      t.integer :protein_consumed
      t.integer :calories_consumed
    end
  end
end
