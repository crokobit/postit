class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "register success"
      redirect_to root_path
    else
      flash[:error] = "register fail"
      render :new
    end
  end

  def edit; end

  def show; end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
