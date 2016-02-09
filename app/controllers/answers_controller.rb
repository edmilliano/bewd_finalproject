class AnswersController < ApplicationController
before_action :load_answer, only: [:edit, :show, :update]

def index
end
	
def create
  	if user_signed_in?
  		@question = Question.find(params[:question_id])
	    @answer = @question.answers.create(safe_answer_params)
	    @answer.user = current_user	
	    redirect_to question_path(@question)
 	else redirect_to new_user_session_path, alert: "Only logged in users can answer questions"
  end
end

def edit
	@answer = Answer.find(params[:id])
end

def update
	@answer = Answer.find(params[:id])
    if @answer.update(safe_answer_params)
      redirect_to questions_path
    else
      render 'edit'
    end
end

def destroy
 	@answer = Answer.find params[:id]
    current_user.answers.delete(@answer)
    current_user.save()
    redirect_to questions_path, alert: "Your answer has been removed."
end

def upvote
	@answer = Answer.find(params[:id])
	@answer.votes.create
	redirect_to questions_path(@question)
end

def show
end


private

def load_answer
    @answer = Answer.find(params[:id])
  end

 def safe_answer_params
 	params.require(:answer).permit(:answertext)
 end
end
