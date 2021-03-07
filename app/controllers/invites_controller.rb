class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @invites = [@invite]
  end

  def create
    invite_params.each do |param|
      @invite = Invite.new(param)
      if @invite.save
        UserMailer.with(user: @invite).invite_email.deliver_later
      end
    end
  end

  private

  def invite_params
    params.require(:invites).map { |invite| invite.permit(:email, :first_name) }
  end
end
