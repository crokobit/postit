class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) != nil
      session[:user_id] = user.id
      flash[:notice] = "Log In Success"
      redirect_to posts_path
    else
      flash[:alert] = "Log In Fail"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Log Out Success"
    redirect_to root_path
  end
end
