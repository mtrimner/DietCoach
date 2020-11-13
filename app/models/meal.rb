class Meal < ApplicationRecord
    has_many :foods, dependent: :destroy
    has_many :users, through: :foods
    
    scope :high_protein, -> { where("protein > 30")}
    scope :high_carb, -> { where("carbs > 30")}
    scope :high_fat, -> { where("fat > 15")}

    def foods_attributes=(food_attributes)
        food_attributes.values.each do |food|
            if food[:name] != "" && food[:serving_size] != "" && food[:carbs] != "" && food[:fat] != "" && food[:protein] != "" && food[:user_id] != ""
                self.foods.build(food)
            end
        end
    end

    def get_user_meal_foods(user)
        self.foods.where(user_id: user.id)
    end

end
    