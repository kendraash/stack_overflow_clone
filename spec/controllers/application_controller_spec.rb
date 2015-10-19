require 'rails_helper'

RSpec.configure do |c|
  c.infer_base_class_for_anonymous_controllers = false
end

# describe ApplicationController do
#   controller do
#     def index
#       render :text => "Hello World"
#     end
#   end
#
#   describe '#current_user' do
#     it 'returns the current user' do
#       @user = FactoryGirl.create(:user)
#       visit users_path
#       click_on "Sign In"
#       fill_in 'Email', :with => @user.email
#       fill_in 'Password', :with => 'foo'
#       click_on "Sign In"
#       get :index
#       expect(controller.current_user).to eq @user
#     end
#   end
# end
