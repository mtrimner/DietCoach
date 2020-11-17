class ApplicationController < ActionController::Base
    before_action :set_user
    before_action :authenticate_user! 

    private

    def after_sign_in_path_for(resource)
        if current_user.diet != nil
            user_diet_path(current_user, current_user.diet)
        else
            root_path
        end
      end

    def set_user
        @user = current_user
    end 
      
    
end
