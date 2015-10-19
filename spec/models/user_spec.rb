require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should have_many :questions }
  it { should have_many :answers }

  it 'is not admin by default' do
    expect(@user.is_admin?).to eq false
  end

  it 'returns correct username' do
    expect(@user.username).to eq 'Bernie Sanders'
  end

  it 'returns correct email' do
    expect(@user.email).to eq 'bernie@sanders.com'
  end

  it 'returns correct password' do
    expect(@user.password).to eq 'password'
  end

  it 'can authenticate' do
    expect(User.authenticate(@user.email, @user.password)).to eq @user
  end

  it 'returns nil if authentication fails' do
    expect(User.authenticate('foo@bar.com', @user.password)).to eq nil
    expect(User.authenticate(@user.email, 'foo')).to eq nil
  end
end
