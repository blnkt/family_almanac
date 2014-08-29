class SessionsController < ApplicationController
  def new
    render 'sessions/new.html.erb'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
      flash[:notice] = "You are family!"
    else
      flash[:alert] = "Hmm...are you sure you're here?"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
    flash[:notice] = "y'all come back now."
  end
end
