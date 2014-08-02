class UsersController < ApplicationController
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

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
