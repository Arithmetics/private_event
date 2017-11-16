module EventsHelper

  def current_user_owns_event?(event)
    if event.creator == current_user
      true
    else
      false
    end
  end
end
