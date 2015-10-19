require 'rails_helper'

describe 'the add a user process' do
  it 'can add a user' do
    password = 'password'

    visit users_path
    click_on 'Sign Up'
    fill_in 'Username', :with => 'Bernie Sanders'
    fill_in 'Email', :with => 'bernie@sanders.com'
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password
    click_on 'Sign Up'
    expect(page).to have_content 'Bernie Sanders'
  end
end
