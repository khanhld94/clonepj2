class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  
  def new 
  end

  def edit
  end
  
  def index
  end

  def destroy
    if @category.destroy
      flash[:success] = t "categories.deleted"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_categories_path    
  end

  def update
    if @category.update category_params
      flash[:success] = t "categories.update"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_categories_path  
  end

  def create
    if @category.save
      flash[:success] = t "categories.success"
      redirect_to root_path
    else
      render :new
    end    
  end

  private
  def category_params
    params.require(:category).permit :name, :description
  end
end