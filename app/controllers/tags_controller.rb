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
        respond_to do |format|
          format.html {redirect_to image_path(@tag.image.last)}
          format.js
        end
      end
    else
      @tag = Tag.new(tag_params)
      if @tag.save
        flash[:notice] = "Tag created!"
        respond_to do |format|
          format.html {redirect_to image_path(@tag.image.first)}
          format.js
        end
      else
        flash[:alert] = "Whoops, that didn't work."
        redirect_to image_path(@image)
      end
    end
  end

private
  def tag_params
    params.require(:tag).permit(:description, :image_ids, :user_ids)
  end
end
