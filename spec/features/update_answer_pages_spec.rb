require 'rails_helper'

describe 'the vote on an answer process' do
  before do
    @user = FactoryGirl.create(:user)
    login(@user)
    @question = FactoryGirl.create(:question)

    @answer = FactoryGirl.create(:answer)
    @answer.question = @question
    @answer.user = @user
    @answer.save

    @question.user = @user
    @question.answers.push(@answer)
    @question.save
  end

  it 'defaults to 0 votes' do
    visit question_path(@question)
    expect(page).to have_content 'Current Votes: 0'
    # expect(@question.votes).to eq 0
  end

  it 'allows a user to upvote an answer' do
    visit question_path(@question)
    find('.answer-voting #up-vote').click
    expect(page).to have_content 'Current Votes: 1'
    # expect(@question.votes).to eq 1
  end

  it 'allows a user to downvote an answer' do
    visit question_path(@question)
    find('.answer-voting #down-vote').click
    expect(page).to have_content 'Current Votes: -1'
    # expect(@question.votes).to eq -1
  end

  it 'doesn\'t allow user to vote if already voted' do
    visit question_path(@question)
    find('.answer-voting #up-vote').click
    find('.answer-voting #up-vote').click
    expect(page).to have_content 'You\'ve already voted'
    expect(page).to have_content 'Current Votes: 1'
  end
end
