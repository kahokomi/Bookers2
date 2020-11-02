class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
