class PhotosController < ApplicationController
  before_filter :authorize, only: [:new, :create, :show]

  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Your photo is part of the family"
      redirect_to user_photos_path(@user)
    else
      render('new')
    end
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @tag = @photo.tags.new
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @user = @photo.user
    @tags = @photo.tags
    @tags.each do |tag|
      tag.destroy
    end
    @photo.destroy
    redirect_to user_path(@user)
  end

private
  def photo_params
    params.require(:photo).permit(:pic)
  end

end
