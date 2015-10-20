require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "signup_confirmation" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.signup_confirmation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Sign up confirmation!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["student@epicodus.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "thank_you_question" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserMailer.thank_you_question(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Question Submitted")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["student@epicodus.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Thanks for submitting a question")
    end
  end

  describe "question_answered" do
    let(:user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question) }
    let(:answer) { FactoryGirl.create(:answer) }
    let(:mail) { UserMailer.question_answered(user, question, answer) }

    before do
      question.user = user
      answer.user = FactoryGirl.create(:user)
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Question Answered")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["student@epicodus.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Your question has been answered!!")
      expect(mail.body.encoded).to have_content(user.username)
      expect(mail.body.encoded).to have_content(answer.user.username)
      expect(mail.body.encoded).to have_content(question.title)
      expect(mail.body.encoded).to have_content(answer.content)
    end
  end

end
