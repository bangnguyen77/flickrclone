class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent"
      redirect_to images_path
    else
      flash[:alert] = "Oops, something went wrong!"
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :media_url, :to)
  end

end
