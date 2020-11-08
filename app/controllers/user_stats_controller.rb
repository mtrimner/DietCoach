class UserStatsController < ApplicationController

    def new
        @user = current_user
        @user_stats = UserStat.new(user_id: params[:user_id])
    end
    
    def create
        @user = current_user
        @user_stats = UserStat.new(user_stats_params)
        if @user_stats.save
            redirect_to new_user_diet_path(@user)
        else  
            render "/user_stats/new"
        end
    end

    
    private

    def user_stats_params
        params.require(:user_stat).permit(:sex, :height_inches, :birthday, :user_id)
    end
end