module  UserHelper
  def login(user)
    visit root_path
    click_on "Sign In"
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button "Sign In"
    expect(page).to have_content user.username
  end

  def logout(user)
    click_link 'Log Out'
  end

end
