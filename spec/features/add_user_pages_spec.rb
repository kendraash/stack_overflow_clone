require 'rails_helper'

describe 'the add a user process' do
  password = 'password'

  it 'can add a user' do
    visit users_path
    click_on 'Sign Up'
    fill_in 'Username', :with => 'Bernie Sanders'
    fill_in 'Email', :with => 'bernie@sanders.com'
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password
    click_on 'Sign Up'
    expect(page).to have_content 'Bernie Sanders'
  end

  it 'displays errors when the form password and password confirmation do not match' do
    visit users_path
    click_on 'Sign Up'
    fill_in 'Username', :with => 'Bernie Sanders'
    fill_in 'Email', :with => 'bernie@sanders.com'
    fill_in 'Password', :with => password
    click_on 'Sign Up'
    expect(page).to have_content "There was a problem creating your account"
  end

  it 'displays errors when the form is incomplete' do
    visit users_path
    click_on 'Sign Up'
    click_on 'Sign Up'
    expect(page).to have_content "errors"
  end

  it 'allows a user to sign in' do
    visit users_path
    @user = FactoryGirl.create(:user)
    click_on "Sign In"
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_on "Sign In"
    expect(page).to have_content @user.username
  end
end
