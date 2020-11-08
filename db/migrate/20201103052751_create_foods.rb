class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :carbs
      t.integer :fat
      t.integer :protein
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true
    end
  end
end
