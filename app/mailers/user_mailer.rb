class UserMailer < ApplicationMailer
  default from: "student@epicodus.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"
    @user = user

    mail to: user.email, subject: "Sign up confirmation!"
  end

  def thank_you_question(user)
    @greeting = "Thanks for submitting a question"
    @user = user
    mail to: user.email, subject: "Question Submitted"
  end

  def question_answered(user, question, answer)
    @greeting = "Your question has been answered!!"
    @user = user
    @question = question
    @answer = answer
    mail to: user.email, subject: "Question Submitted"

  end
end
