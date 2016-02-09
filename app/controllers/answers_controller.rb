class AnswersController < ApplicationController

def create
  	if user_signed_in?
  		@question = Question.find(params[:question_id])
	    @answer = @question.answers.create(safe_answer_params)
	    @answer.user = current_user	
	    redirect_to question_path(@question)
 	else redirect_to new_user_session_path, alert: "Only logged in users can create comments"
  end
 end

 def destroy
 	@question = Question.find(params[:question_id])
 	@answer = @question.answers.create(safe_answer_params)
 	@answer.destroy
 	redirect_to_question_path(@question)
 end


 private
 def safe_answer_params
 	params.require(:answer).permit(:answertext)
 end
end
