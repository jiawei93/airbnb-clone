class UserJob < ApplicationJob
  queue_as :email

  def perform(email)
    WelcomeMailer.follow_up_email(email).deliver
    # Do something later
  end
end
