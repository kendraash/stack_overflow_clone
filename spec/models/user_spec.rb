require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should have_many :questions }
  # it { should have_many :answers }

  it 'is not admin by default' do
    @user.is_admin?.should eq false
  end

  it 'returns correct username' do
    expect(@user.username).to eq 'Bernie Sanders'
  end

  it 'returns correct email' do
    expect(@user.email).to eq 'bernie@sanders.com'
  end
end
