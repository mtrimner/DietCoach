class HomeController < ApplicationController
def index
    if user_signed_in?
    @user = current_user
    @diet = Diet.find_by(user_id: @user.id)
    end
end

end