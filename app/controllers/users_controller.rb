class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :require_sign_in, only: [:show]
  before_action :require_same_user, only: [:edit, :create]
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
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_same_user
    if  logged_in? && @user != current_user
      flash[:error] = "need be same user to do that"
      redirect_to root_path
    end
  end
end
