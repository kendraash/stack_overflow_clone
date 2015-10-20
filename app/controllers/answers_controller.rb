class AnswersController<ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(votes: (@answer.votes + (params[:f][:votes]).to_i))
    redirect_to question_path(@question)
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
