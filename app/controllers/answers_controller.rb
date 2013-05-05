class AnswersController < ApplicationController
  before_action :require_login, except: [:show, :index]

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      # Users automatically vote for their own questions
      Vote.new(votable: @answer, user: current_user).save

      redirect_to @question
    else
      render :new
    end
  end

  def vote
    @answer = Answer.find(params[:id])
    @vote = Vote.new
    @vote.votable = @answer
    @vote.user = current_user

    if @vote.save
      redirect_to @answer.question, notice: "Thanks for voting!"
    else
      redirect_to @answer.question, alert: "You've already voted for that, but thanks for your enthusiasm!"
    end
  end

  private

  def answer_params
      params.require(:answer).permit(:body)
  end
end
