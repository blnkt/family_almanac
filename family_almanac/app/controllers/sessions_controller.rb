class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You're family!"
      redirect_to user_photos_path(user)
    else
      flash[:alert] = "Hmm...are you sure you're here?"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "y'all come back now."
    redirect_to root_path
  end
end
