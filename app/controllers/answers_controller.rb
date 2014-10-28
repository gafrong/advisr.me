class AnswersController < ApplicationController

  before_action :authenticate_user!

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create  
    @answer = Answer.new
    @answer.user_id = current_user.id
    @answer.advise = params[:answer][:advise]
    @answer.question_id = params[:answer][:question_id]
    # @question = Question.find(@answer.question_id).content
    
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def show    
    @answer = Answer.find(params[:id])
  end
  

end