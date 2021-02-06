class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    @url  = ENV['REGISTRATION_URL']
    mail(to: @user.email, subject: 'Welcome to the Eclectic Book Club App')
  end
end
