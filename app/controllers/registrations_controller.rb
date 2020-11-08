class RegistrationsController < Devise::RegistrationsController
    skip_before_action :set_user
    

    private

    def sign_up_params
        params.require(:user).permit(:name, :sex, :email, :birthday, :height_inches, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

    # def after_sign_up_path_for(resource)
    #     new_user_user_stat_path(current_user)
    # end

    # def after_inactive_sign_up_path_for(resource)
    #     new_user_user_stat_path(current_user)
    # end
end