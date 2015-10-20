class User < ActiveRecord::Base
  validates_presence_of :username, :email
  has_many :questions
  has_many :answers

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  # def send_confirmation_message
  #     CustomerMailer.deliver_welcome_message(self)
  # end


  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
