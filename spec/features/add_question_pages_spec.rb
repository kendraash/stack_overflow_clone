require 'rails_helper'

describe 'the add a question process' do
  before do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  it 'allows a user to add a new question' do
    visit questions_path
    click_on 'Ask Question'
    fill_in 'Title', :with => 'Which is the best dog?'
    click_on 'Ask Question'
    expect(page).to have_content 'Which is the best dog?'
    expect(page).to have_content @user.username
  end

  it 'throws an error if title isn\'t filled in' do
    visit questions_path
    click_on 'Ask Question'
    click_on 'Ask Question'
    expect(page).to have_content 'errors'
  end
end
