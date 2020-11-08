class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :goal
      t.date :start_date
      t.date :end_date
      t.string :starting_weight
      t.string :target_weight
    end
  end
end
