require 'rails_helper'

describe Question do
  before do
    @question = FactoryGirl.create(:question)
  end

  it { should validate_presence_of :title}
  it { should belong_to :user}
  it { should have_many :answers}
end
