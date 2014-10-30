class QuestionsController < ApplicationController

  before_action :authenticate_user!

  def index
    if !params[:search].present?
      @questions = Question.all
    else
      @questions = Question.where("content ilike ?", "%#{params[:search]}%")
    end
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @question = Question.new
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: @question.id).order("created_at DESC")
    @comments = @question.comments.order("created_at DESC")

    if @question.comments.blank?
      @avg_rating = 0
    else
      @avg_rating = @question.comments.average(:rating).round(2)
    end
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



end

