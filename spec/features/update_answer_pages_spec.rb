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

describe 'the update an answer process' do
  before do
    @admin = FactoryGirl.create(:user)
    @admin.is_admin = true
    @admin.save
    login(@admin)
    @question = FactoryGirl.create(:question)
    @answer = FactoryGirl.create(:answer)

    @answer.question = @question
    @answer.user = FactoryGirl.create(:user)
    @answer.save

    @question.user = @admin
    @question.save
  end

  it 'can edit an answer if admin' do
    visit admin_path
    find('.edit-answer').click
    fill_in 'Content', :with => 'new content'
    click_on 'Add Answer'
    expect(page).to have_content 'new content'
  end

  it 'shows errors if content is empty' do
    visit admin_path
    find('.edit-answer').click
    fill_in 'Content', :with => ''
    click_on 'Add Answer'
    expect(page).to have_content 'errors'
  end
end
