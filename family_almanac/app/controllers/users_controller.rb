class UsersController < ApplicationController
before_filter :authorize, only: [:index, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "When you're here you're family."
      redirect_to user_photos_path(@user)
    else
      render('new')
    end
  end

  def show
    @user = User.find(params[:id])
    @tagged = Tag.where(user_id: @user.id)
  end
  def destroy
    @user = User.find(params[:user_id])
    @photos = @user.photos
    @photos.each do |photo|
      @tags = photo.tags
      @tags.each do |tag|
        tag.destroy
      end
      photo.destroy
    end
    @user.destroy
    flash[:notice] = "Shunned."
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
