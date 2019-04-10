class UserMailer < ApplicationMailer
  default from: ENV['USER_NAME']

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to KeepTrack!')
  end
  def reminder_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to KeepTrack!')
  end
end
