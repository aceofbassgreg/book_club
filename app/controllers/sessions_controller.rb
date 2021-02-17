class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to events_url
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to '/polls'
  end
end
