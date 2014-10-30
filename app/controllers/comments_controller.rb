class CommentsController < ApplicationController


  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create  
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.feed = params[:comment][:feed]
    @comment.answer_id = params[:comment][:answer_id]
    @comment.rating = params[:comment][:rating]

    if @comment.save
      redirect_to question_path(@comment.answer.question_id)
    else
      render :new
    end
  end

  def show    
    @comment = Comment.find(params[:id])
  end
  
end