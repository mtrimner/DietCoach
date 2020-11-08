class AddUserRefToDiets < ActiveRecord::Migration[6.0]
  def change
    add_reference :diets, :user, null: false, foreign_key: true
  end
end
