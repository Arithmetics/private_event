module InvitationsHelper


  def current_user_invited_to_event?(event)
    if event.invitees.any? {|invitee| invitee == current_user }
      true
    else
      false
    end
  end


end
