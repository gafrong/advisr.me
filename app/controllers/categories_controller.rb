class CategoriesController < ApplicationController

  before_action :check_if_logged_in

  def index
    @categories = Category.all
    @questions = Question.all
  end

  def new
    @category = Category.new
  end

  def show
    @users = User.all
    @categories = Category.all
    @questions = Question.where(category_id: params[:id])
    # @user = User.where(id: question.user_id)
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