class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to events_path if current_user

    if !user_invited?(params[:user].split('+').last) || params[:user].nil?
      flash.alert = 'Sorry, something went wrong.'
      redirect_to root_url
    end

    first_name, email = params['user'].split('+')
    @user = User.new(first_name: first_name, email: email)
  end

  def create
    invited = user_invited?(user_params[:email])

    if !invited
      flash.alert = 'Sorry, something went wrong.'
      redirect_back(fallback_location: root_path)
    elsif matching_passwords? && invited
      @user = User.create(user_params.except(:password_confirm))
      if @user.valid?
        flash.notice = "Thanks for joining, #{@user.first_name}!"
        session[:current_user_id] = @user.id
        redirect_to events_url
      else
        flash.alert = "User did not create successfully: #{@user.errors.full_messages.to_sentence}."
        redirect_back(fallback_location: root_path)
      end
    elsif !matching_passwords?
      flash.alert = 'Password confirmation does not match password.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def matching_passwords?
    user_params[:password] == user_params[:password_confirm]
  end

  def user_invited?(email)
    Invite.find_by(email: email)
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,:password, :password_confirm
    )
  end
end
