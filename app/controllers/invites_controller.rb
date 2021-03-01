class InvitesController < ApplicationController
  def new
    @invite = Invite.new
  end

  def create
    @invite.create(params: invite_params)
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :first_name)
  end
end
