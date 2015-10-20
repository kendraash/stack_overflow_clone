class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      UserMailer.thank_you_question(current_user).deliver_now
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
    @answers = @question.sorted_answers
  end

  def update
    @question = Question.find(params[:id])
    if params[:f] # if voting
      vote_helper params[:f][:votes]
    else # normal model update
      if @question.update(question_params)
        redirect_to admin_path
      else
       render :edit
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.each do |answer|
      answer.destroy
    end
    @question.destroy
    redirect_to admin_path
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end

  def vote_helper(vote_count)
    @vote = Vote.where(user_id: current_user.id, votable_id: @question.id, votable_type: 'Question')
    if @vote.any?
      flash[:notice] = 'You\'ve already voted.'
    else
      @question.votes.create(count: vote_count, user_id: current_user.id, votable_id: @question.id, votable_type: 'Question')
    end
     redirect_to question_path(@question)
  end
end
