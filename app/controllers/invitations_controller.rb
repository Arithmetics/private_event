class InvitationsController < ApplicationController
  before_action :correct_user, only: [:reject, :accept]

  def show
    @invitation = Invitation.find(params[:id])
  end


  def reject
    @invitation.destroy
    redirect_to current_user
  end

  def accept
    @rsvp = Rsvp.new(attendee_id: @invitation.invitee_id, attended_event_id: @invitation.invited_event_id)
    if @rsvp.save
      @invitation.destroy
      redirect_to @rsvp.attended_event
    else
      render 'invitation'
    end
  end


  def new
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build

  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = @event.invitations.build(invitation_params)
    if @invitation.save
      redirect_to @event
    else
      render 'new'
    end

  end

private ########################################333

  def invitation_params
    params.require(:invitation).permit(:message, :invitee_id, :date)
  end

  def correct_user
    @invitation = current_user.invitations.find_by(id: params[:id])
    redirect_to root_url if @invitation.nil?
  end

end
