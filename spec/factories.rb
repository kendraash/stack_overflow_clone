FactoryGirl.define do
  factory(:user) do
    username('Bernie Sanders')
    email('bernie@sanders.com')
    password('password')
  end

  factory(:question) do
    title('Best kind of dog?')
  end
end
