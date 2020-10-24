class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        # render json: params
        @user = User.find(params[:user_id])
        @posts = Post.where(user_id: params[:user_id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:user_id])
    end

    def update
        # render json: params
        user = User.find(params[:user_id])
        user.update!(
            username: params[:user][:username],
            password: params[:user][:password]
        )
        redirect_to users_path

    end

    def create
        # render json: params
        User.create!(user_params)
        redirect_to users_path
    end

    def destroy
        User.destroy(params[:user_id])
        redirect_to users_path
    end

    private
    def user_params
        # params.require(:form_name).permit(:field1, :field2, etc)
        return params.require(:user).permit(:username, :password)
    end
end
