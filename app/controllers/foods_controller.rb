class FoodsController < ApplicationController


    def create
        # @user = current_user
        @diet = Diet.find_by(user_id: @user.id)
        @meal = Meal.find_by_id(params[:meal_id])
        @meal.foods.each do | food |
         @user.foods.build(name: food.name, carbs: food.carbs, fat: food.fat, protein: food.protein, meal: @meal, serving_size: food.serving_size)
        end
        if @user.save
            flash[:notice] = "Food added to your library"
           
            redirect_to meals_path
        else
            render 'meals/index'
        end
    end
end