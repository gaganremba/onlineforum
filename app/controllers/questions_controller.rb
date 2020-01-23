class QuestionsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
    @questions = Question.includes(comments:[:user]).paginate(page: params[:page], per_page: 30)
  end
  def new
    @question = current_user.questions.new
  end
  def create
      @question = current_user.questions.new(question_params)
      if @question.save
        flash[:success] = "Question created successfully"
        redirect_to root_path
      else
        flash[:errors] = @question.errors.full_messages
        render :new
      end
  end
  def answer
     @question = Question.includes(:comments).find_by(id: params[:id])    
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
