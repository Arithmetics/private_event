class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Private Event thanks for signing up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @hosted_events = @user.hosted_events.all
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def index
  end

  private ###########################################################

  def user_params
    params.require(:user).permit(:username)
  end


end
