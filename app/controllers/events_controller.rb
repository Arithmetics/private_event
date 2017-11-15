class EventsController < ApplicationController


  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to @user
    else
      render 'new'
    end 
  end

private ###########################################################

def event_params
  params.require(:event).permit(:title, :details, :date)
end

end
