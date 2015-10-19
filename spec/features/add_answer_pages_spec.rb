require "rails_helper"

describe 'add a answer to a question' do
  before do
    @question = FactoryGirl.create(:question)
    @user = FactoryGirl.create(:user)
    @question.user = @user
    @question.save
    login(@user)
  end

  it 'allows a user to give an answer to a question' do
    visit questions_path
    click_on @question.title
    click_on "Add Answer"
    fill_in "Content", :with => "Bernedoodles"
    click_on "Add Answer"
    expect(page).to have_content("Bernedoodles")
  end

  it 'throws an error if no content is added' do
    visit question_path(@question)
    click_on "Add Answer"
    click_on "Add Answer"
    expect(page).to have_content 'errors'
  end
end
