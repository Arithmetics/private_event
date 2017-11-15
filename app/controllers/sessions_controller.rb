class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user
      log_in(@user)
      redirect_to @user
    else
      flash[:danger] = "No such username"
      redirect_to root_path
    end
  end

  def destroy
    log_out 
    redirect_to root_path
  end

end
