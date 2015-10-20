require 'rails_helper'

describe Question do
  it { should validate_presence_of :title}
  it { should belong_to :user}
  it { should have_many :answers}
  it { should have_many :votes }

  it 'should append a question mark if it doesn\'t have one' do
    question = Question.create(:title => 'test')
    expect(question.title).to eq 'test?'
  end

  it 'should not append a question mark if it has one' do
    question = Question.create(:title => 'test?')
    expect(question.title).to eq 'test?'
  end
end
