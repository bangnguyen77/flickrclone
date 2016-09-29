class ImagesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    @images = Image.all
    @hash = Gmaps4rails.build_markers(@images) do |image, marker|
      marker.lat image.latitude
      marker.lng image.longitude
      marker.infowindow render_to_string(:partial => '/images/marker', :locals => { :image => image})
    end
  end

  def show
    @image = Image.find(params[:id])
    @tag = Tag.new
    @message = Message.new
    @hash = Gmaps4rails.build_markers(@image) do |image, marker|
      marker.lat image.latitude
      marker.lng image.longitude
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Woohoo! You successfully uploaded an image!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Whoops, your image was not uploaded."
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @image = Image.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Your image has been edited!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Whoops, your image was not edited!"
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Your image has been deleted!"
    redirect_to user_path(@user)
  end

private
  def image_params
    params.require(:image).permit(:title, :user_id, :image, :address)
  end
end
