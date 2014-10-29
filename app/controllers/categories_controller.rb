class CategoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    @categories = Category.all
    @questions = Question.all
  end

  def new
    @category = Category.new
  end

  def show
    @categories = Category.all
    @questions = Question.where(category_id: params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end