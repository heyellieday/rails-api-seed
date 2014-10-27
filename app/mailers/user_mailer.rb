class UserMailer < ActionMailer::Base
  default from: ENV['user_mailer_from_email']

  def welcome_email(user)
    @user = user
    @url  = ENV['user_mailer_url']
    @site = ENV['user_mailer_subject']
    mail(to: @user.email, subject: @subject)
  end
end
