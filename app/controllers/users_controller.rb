class UsersController < ApplicationController

def index
  @user = User.all
end

def show
  @user = User.find(params[:id])
end

def new
  @user = User.new
end

def create
  @user = User.new(params[:email])
  @user.save
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user = User.update(user_params_all)
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
end



private

def user_params
  params.require(:user).permit(:email)
end

def User_params_all
  params.require(:user)
end

end
