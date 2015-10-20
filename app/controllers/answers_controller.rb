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

    @vote = Vote.where(user_id: current_user.id, votable_id: @answer.id, votable_type: 'Answer')
    if @vote.any?
      flash[:notice] = 'You\'ve already voted.'
    else
      @answer.votes.create(count: params[:f][:votes], user_id: current_user.id, votable_id: @answer.id, votable_type: 'Answer')
    end
    redirect_to question_path(@question)
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
