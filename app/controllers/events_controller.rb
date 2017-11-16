class EventsController < ApplicationController


  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = current_user.hosted_events.build
  end

  def show
    @event = Event.find(params[:id])

  end

  def create
    @user = current_user
    @event = @user.hosted_events.build(event_params)
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
