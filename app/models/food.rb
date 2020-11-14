class Food < ApplicationRecord
    belongs_to :user
    belongs_to :meal, optional: true
    validates :carbs, numericality: true
    validates :protein, numericality: true
    validates :fat, numericality: true
    validates :serving_size, numericality: true

    scope :high_protein, -> { where("protein > 12")}
    scope :high_carb, -> { where("carbs > 15")}
    scope :high_fat, -> { where("fat > 9")}
    scope :associated_food, -> (user_id, meal_id) {where("meal_id = ? AND meal_id = ?", user_id, meal_id)}
end