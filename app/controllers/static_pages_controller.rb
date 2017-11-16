class StaticPagesController < ApplicationController

  def home
    @users = User.all
    @events = Event.all 
  end

end
