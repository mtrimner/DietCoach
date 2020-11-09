module DietsHelper 
    
    def calories_per_meal
        (daily_calories / current_user.diet.meals_per_day)
    end

    def protein_amount
        ((calories_per_meal * 0.25) / 4).floor
    end

    def fat_amount
        ((calories_per_meal * 0.25) / 9).floor
    end

    def carbs_amount
        ((calories_per_meal * 0.25) / 4).floor
    end

end