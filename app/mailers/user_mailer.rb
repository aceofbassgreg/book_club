class UserMailer < ApplicationMailer
  def invite_email
    @user = params[:user]
    @url  = ENV['REGISTRATION_URL'] + user_hash
    mail(to: @user.email, subject: 'Welcome to the Eclectic Book Club App')
  end

  private

  def user_hash
    Digest::SHA256.hexdigest("#{@user.first_name}+#{@user.email}")
  end
end
