require 'rails_helper'

describe 'the vote on a question process' do
  before do
    @user = FactoryGirl.create(:user)
    login(@user)
    @question = FactoryGirl.create(:question)
    @question.user = @user
    @question.save
  end

  it 'defaults to 0 votes' do
    visit question_path(@question)
    expect(page).to have_content 'Current Votes: 0'
    # expect(@question.votes).to eq 0
  end

  it 'allows a user to upvote a question' do
    visit question_path(@question)
    find('.question-voting #up-vote').click
    expect(page).to have_content 'Current Votes: 1'
    # expect(@question.votes).to eq 1
  end

  it 'allows a user to downvote a question' do
    visit question_path(@question)
    find('.question-voting #down-vote').click
    expect(page).to have_content 'Current Votes: -1'
    # expect(@question.votes).to eq -1
  end

  it 'doesn\'t allow user to vote if already voted' do
    visit question_path(@question)
    find('.question-voting #up-vote').click
    find('.question-voting #up-vote').click
    expect(page).to have_content 'You\'ve already voted'
    expect(page).to have_content 'Current Votes: 1'
  end
end
