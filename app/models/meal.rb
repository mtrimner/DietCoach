class Meal < ApplicationRecord
    has_many :foods
    has_many :users, through: :foods
    

    # accepts_nested_attributes_for :foods, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:serving_size].blank? || attributes[:carbs].blank? || attributes[:fat].blank? || attributes[:protein].blank? || attributes[:user_id].blank? }

    def foods_attributes=(food_attributes)
        food_attributes.values.each do |food|
            if food[:name] != "" && food[:serving_size] != "" && food[:carbs] != "" && food[:fat] != "" && food[:protein] != "" && food[:user_id] != ""
                self.foods.build(food)
            end
        end
    end

end
    