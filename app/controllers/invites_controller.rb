class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
      UserMailer.with(user: @invite).invite_email.deliver_later
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :first_name)
  end
end
