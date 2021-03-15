class UserMailer < ApplicationMailer
  def invite_email
    @user = params[:user]
    base_url = "#{ENV['REGISTRATION_URL']}?"
    params = URI.encode_www_form('user' => user_str)
    @url = "#{base_url}#{params}"
    mail(to: @user.email, subject: 'Welcome to the Eclectic Book Club App')
  end

  private

  def user_str
    "#{@user.first_name}+#{@user.email}"
  end
end
