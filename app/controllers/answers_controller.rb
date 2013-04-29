class AnswersController < ApplicationController
  before_action :require_login, except: [:show, :index]
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end

  def answer_params
      params.require(:answer).permit(:body)
  end
end
