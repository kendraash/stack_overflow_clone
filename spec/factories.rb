FactoryGirl.define do
  factory(:user) do
    username('Bernie Sanders')
    email('bernie@sanders.com')
    password('password')
  end
end
