class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      #redirect_to current_user_root
    else
      flash[:errors] = "invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path, alert: "Your session has ended"
  end

end
