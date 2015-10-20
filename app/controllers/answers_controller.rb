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

    if params[:f] # if voting
      vote_helper params[:f][:votes]
    else # normal model update
      if @answer.update(answer_params)
        redirect_to admin_path
      else
       render :edit
      end
    end
  end


  private
  def answer_params
    params.require(:answer).permit(:content)
  end

  def vote_helper(vote_count)
    @vote = Vote.where(user_id: current_user.id, votable_id: @answer.id, votable_type: 'Answer')
    if @vote.any?
      flash[:notice] = 'You\'ve already voted.'
    else
      @answer.votes.create(count: vote_count, user_id: current_user.id, votable_id: @answer.id, votable_type: 'Answer')
    end
     redirect_to question_path(@question)
  end
end
