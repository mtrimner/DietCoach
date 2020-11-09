class MealsController < ApplicationController

    def index
        @meals = Meal.all
        # @user = current_user
        @user_meals = @user.meals.uniq
        @community_meals = @meals - @user.meals
    end
    
    def new
        # @user = current_user
        @meal = Meal.new
        5.times { @meal.foods.build }
    end

    def create
       assign_meal_macros
       @user = current_user
       @diet = Diet.find_by(user_id: @user.id)
       @meal = Meal.new(meal_params)
            if @meal.save

                 if params[:meal][:location]
                     redirect_to user_diet_path(@user, @diet)
                 else
                 redirect_to meal_path(@meal) 
                 end
            else
            render "new"
            end
    end

    def show
        @meal = Meal.find_by(id: params[:id])
    end

    def destroy
        @meal = Meal.find_by_id(params[:id])
        @user.meals.delete(@meal)
        @user_foods = Food.associated_food(@user.id, @meal.id)

        if @meal.foods.count == 0
            @meal.delete
        end
       redirect_to meals_path
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :carbs, :fat, :protein, foods_attributes: [:name, :serving_size, :carbs, :fat, :protein, :user_id])
    end

    
    def assign_meal_macros
        total_meal_carb_count
        total_meal_fat_count
        total_meal_protein_count
    end


    def total_meal_carb_count
        carb_count
        @total_carbs = @carbcount.reduce(:+)
        params[:meal][:carbs] = @total_carbs
    end

    def carb_count
        @carbcount = meal_params[:foods_attributes].values.map do |food|
        food[:carbs].to_i
        end
    end

    def total_meal_protein_count
        protein_count
        @total_protein = @proteincount.reduce(:+)
        params[:meal][:protein] = @total_protein
    end

    def protein_count
        @proteincount = meal_params[:foods_attributes].values.map do |food|
        food[:protein].to_i
        end
    end

    def total_meal_fat_count
        fat_count
        @total_fat = @fatcount.reduce(:+)
        params[:meal][:fat] = @total_fat
    end

    def fat_count
        @fatcount = meal_params[:foods_attributes].values.map do |food|
        food[:fat].to_i
        end
    end

end