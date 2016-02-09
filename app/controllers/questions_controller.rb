class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :show, :update]	

  def index
    @question = Question.search_for(params[:q]) 
  end

  def new
  	@question = Question.new
  end

  def create
    @question = Question.new safe_question_params 
    @question.user = current_user
    if @question.save!
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def upvote
    @answer = Answer.find_by_id params[:id]
    redirect_to(answer_path)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(safe_question_params)
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def show
    @question = Question.find params[:id]
    @answer = Answer.new(:question => @question)
  end

  def destroy
    @question = Question.find params[:id]
    current_user.questions.delete(@question)
    current_user.save()
    redirect_to questions_path, alert: "Your question has been removed."
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def safe_question_params 
    params.require(:question).permit(:text, :topic)
  end
end
