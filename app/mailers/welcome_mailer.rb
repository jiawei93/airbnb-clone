class WelcomeMailer < ApplicationMailer
default from: "wongjiawei1993@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://google.com'
    mail(to: @user.email, subject: 'Welcome to GOOGLE!')
  end
end
