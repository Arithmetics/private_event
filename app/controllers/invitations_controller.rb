class InvitationsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @invitation = Invitation.find(params[:id])
  end


  def destroy
    #destroy invitation
    #create rsvp
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

end
