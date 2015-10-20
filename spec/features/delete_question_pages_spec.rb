require 'rails_helper'

describe 'the delete a question process' do
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
    @question.answers.push(@answer)
    @question.save
  end

  it 'can delete a question if admin' do
    visit admin_path
    find('.delete-question').click
    expect(page).to_not have_content @question.title
  end
end
