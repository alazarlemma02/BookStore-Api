class CategoriesController < ApplicationController
  before_action :set_category, only: :destroy

  def index
    @categories = Category.all
    render json:{success: true, data: @categories}
  end

  #this controller is used to create a new category of book
  def create
    @category=Category.create(category_params)

    if @category.save
      render json:{success: true, data:@category}, status: :created
    else
      render json:{success: false, data:@category.errors}, status: :unprocessable_entity
    end
  end

  #this controller is used to delete a category of book
  def destroy
    @category.destroy
    head :no_content
  end

  private

  def category_params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
