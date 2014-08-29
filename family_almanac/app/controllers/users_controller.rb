class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "When you're here you're family."
      redirect_to users_path
    else
      render "new"
    end
  end
end
