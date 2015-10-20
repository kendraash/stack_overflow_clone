class UserMailer < ApplicationMailer
  default from: "student@epicodus.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"

    mail to: user.email, subject: "Sign up confirmation!"
  end
end
