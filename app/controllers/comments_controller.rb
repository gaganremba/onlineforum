class CommentsController < ApplicationController
  before_action :find_commentable, only: :create
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @commentable.comments.build(comment_params)
    if @commentable.save
      flash[:success] = "Comment successfully done"
      redirect_to answer_question_path(params[:comment][:quest_id])
    else
      flash[:error] = @commentable.errors.full_messages
      redirect_to answer_question_path(params[:comment][:quest_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by_id(params[:comment_id]) 
    elsif params[:question_id]
      @commentable = Question.find_by_id(params[:question_id])
    end
  end
end