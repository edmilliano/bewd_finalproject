class QuestionsController < ApplicationController
  before_action :load_question, only: [:edit, :show, :update]	

  def index
    @questions = Question.search_for(params[:q])
  end

  def new
  	@questions = Question.search_for(params[:q])
  end

  def create
    @question = Question.new 
    if @question.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @question = Question.find params[:id]
    @answer = Answer.new 
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end
end
