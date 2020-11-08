class Meal < ApplicationRecord
    has_many :foods
    has_many :users, through: :foods
    

    # accepts_nested_attributes_for :foods

    def foods_attributes=(food_attributes)
      
        food_attributes.values.each do |food|
            if food[:name] != "" && food[:serving_size] != "" && food[:carbs] != "" && food[:fat] != "" && food[:protein] != "" && food[:user_id] != ""
                self.foods.build(food)
            end
        end
    end


    def assign_meal_macros
        total_meal_carb_count
        total_meal_fat_count
        total_meal_protein_count
    end

    private 
    
    def total_meal_carb_count
        carb_count
        @total_carbs = @carbcount.reduce(:+)
        params[:meal][:carbs] = @total_carbs
    end

    def carb_count
        @carbcount = meal_params[:foods_attributes].values.map do |food|
        food[:carbs]
        end
    end

    def total_meal_protein_count
        protein_count
        @total_protein = @proteincount.reduce(:+)
        params[:meal][:protein] = @total_protein
    end

    def protein_count
        @proteincount = meal_params[:foods_attributes].values.map do |food|
        food[:protein]
        end
    end

    def total_meal_fat_count
        fat_count
        @total_fat = @fatcount.reduce(:+)
        params[:meal][:fat] = @total_fat
    end

    def fat_count
        @fatcount = meal_params[:foods_attributes].values.map do |food|
        food[:fat]
        end
    end
    
end