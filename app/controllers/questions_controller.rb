class QuestionsController < ApplicationController

  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def new
    @categories = Category.all
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.user_id = current_user.id
    @question.content = params[:question][:content]
    @question.category_id = params[:question][:category_id]
   
    if @question.save

      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

end