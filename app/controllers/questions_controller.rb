class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      flash[:notice] = "Question added successfully!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def update
    @question = Question.find(params[:id])

    @vote = Vote.where(user_id: current_user.id, votable_id: @question.id)
    if @vote.any?
      flash[:notice] = 'You\'ve already voted.'
    else
      @question.votes.create(count: params[:f][:votes], user_id: current_user.id, votable_id: @question.id)
    end
    redirect_to question_path(@question)
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end
end
