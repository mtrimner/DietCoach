module ApplicationHelper

    def total_calories(foods)
        ((foods.carbs * 4) + (foods.protein * 4) + (foods.fat * 9))
    end

    
end
