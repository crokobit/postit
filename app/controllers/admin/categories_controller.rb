class Admin::CategoriesController < AdminsController
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(name: params[:category][:name]) 
    redirect_to new_admin_category_path
  end
end
