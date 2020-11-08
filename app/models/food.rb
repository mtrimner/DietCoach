class Food < ApplicationRecord
    belongs_to :user
    belongs_to :meal, optional: true

    scope :high_protein, -> { where("protein > 12")}
    scope :high_carb, -> { where("carbs > 15")}
    scope :high_fat, -> { where("fat > 9")}
end