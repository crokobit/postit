class AdminsController < ApplicationController
  before_action :require_admin
  
  private

  def require_admin
    unless current_user && current_user.admin
      flash[:alert] = "require admin"
      redirect_to root_path
    end
  end
end
