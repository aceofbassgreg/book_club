class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:current_user_id] = @user.id
      flash[:notice] = 'Login successful.'
      redirect_to events_url
    else
      flash.alert = 'Login failed.'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = 'Signed out.'
    redirect_to events_url
  end
end
