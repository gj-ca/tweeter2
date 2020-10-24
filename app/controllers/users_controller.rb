class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def create
        # render json: params
        User.create!(user_params)
        redirect_to users_path
    end

    private
    def user_params
        # params.require(:form_name).permit(:field1, :field2, etc)
        return params.require(:user).permit(:username, :password)
    end
end
