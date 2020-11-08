class DietsController < ApplicationController
helper_method :params

def new
    @user = current_user
    @diet = Diet.new(user_id: params[:user_id])
end

def create
    @user = current_user
    @diet = Diet.new(diet_params)
    if @diet.valid?
        if @diet.save
            redirect_to user_diet_path(@user, @diet)
        else  
            render '/new'
        end
    else
        render '/new'
    end
end 

def show
    
        if params[:filter == ""]
            @foods = Food.all
        elsif params[:filter] == "High Protein"
            @foods = Food.high_protein
        elsif params[:filter] == "High Carb"
            @foods = Food.high_carb
        else params[:filter] == "High Fat"
            @foods = Food.high_fat
        end
    
    @user = current_user
    @diet = @user.diet
    @total_cpm = @user.total_energy_expenditure * 0.25
    @start_date = @user.diet.start_date
    @end_date = @user.diet.end_date
    @food = Food.find_by(name: params[:name])
    @meals = Meal.all
    @meal = Meal.new
    if !params[:meal_id].blank?
    @selected_meal = Meal.find_by_id(params[:meal_id])
    end
    6.times { @meal.foods.build }
    
end

def edit 
    @user = current_user
    @diet = Diet.find_by(user_id: @user.id)
end

def update
    @user = current_user
    @diet = Diet.find_by(user_id: @user.id)
      @diet.update(diet_params)
      if @diet.errors.any?
        render "edit"
      else
        redirect_to user_diet_path(@user, @diet)
      end
  end



private

def diet_params
   params.require(:diet).permit(:goal, :current_weight, :target_weight, :activity_level, :end_date, :start_date, :user_id)
end

end