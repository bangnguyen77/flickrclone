class TagsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def new
    @image = Image.find(params[:image_id])
    @user = User.find(current_user.id)
    @tag = Tag.new
  end

  def create
    @image = Image.find(params[:image_id])
    @user = User.find(current_user.id)
    @tags = Tag.where(description: tag_params[:description])
    if @tags != []
      @tag = @tags.first
      if @image.tags.include?(@tag)
        flash[:alert] = "Image already has that tag"
        redirect_to image_path(@image)
      else
        @image.tags.push(@tag)
        flash[:notice] = "Tag added!"
        redirect_to image_path(@image)
      end
    else
      @tag = Tag.new(tag_params)
      if @tag.save
        flash[:notice] = "Tag created!"
        redirect_to image_path(@image)
      else
        flash[:alert] = "Whoops, that didn't work."
        redirect_to image_path(@image)
      end
    end
  end

  # def edit
  #   @image = Image.find(params[:image_id])
  #   @user = User.find(current_user.id)
  #   @tag = Tag.find(params[:tag_id])
  # end
  #
  # def update
  #   @user = User.find(current_user.id)
  #   @image = Image.find(params[:image_id])
  #   @tag = Tag.find(params[:tag_id])
  #   if @image.update(image_params)
  #     flash[:notice] = "Your image has been edited!"
  #     redirect_to user_path(@user)
  #   else
  #     flash[:alert] = "Whoops, your image was not edited!"
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @user = User.find(current_user.id)
  #   @image = Image.find(params[:id])
  #   @image.destroy
  #   flash[:notice] = "Your image has been deleted!"
  #   redirect_to user_path(@user)
  # end

private
  def tag_params
    params.require(:tag).permit(:description, :image_ids, :user_ids)
  end
end
