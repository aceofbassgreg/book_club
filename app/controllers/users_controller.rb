class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash.notice = 'Thanks for joining!'
      redirect_to events_url
    else
      flash.alert = "User did not create successfully: #{@user.errors.full_messages.to_sentence}."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin)
  end
end
