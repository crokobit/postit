class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])  
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(name: params[:category][:name]) 
    render :new
  end
end
