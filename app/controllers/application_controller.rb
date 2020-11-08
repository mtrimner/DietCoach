class ApplicationController < ActionController::Base
    before_action :set_user

    private

    # def after_sign_in_path_for(resource)
    #     new_user_user_stat_path(current_user)
    #   end

    def set_user
        @user = current_user
    end 
      
    
end
