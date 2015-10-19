require 'rails_helper'

describe User do
  it 'is not admin by default' do
    user = FactoryGirl.create(:user)
    user.is_admin?.should eq false
  end
end
