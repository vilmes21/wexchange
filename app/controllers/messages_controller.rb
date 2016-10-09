class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @request = Request.find params[:request_id]
    @message = Message.new
    @messages = @request.messages
  end

  def create
    @message = Message.new message_params
    if @message.save
      redirect_to messages_path(request_id: @message.request_id), notice: "msg sent"
    else
      flash[:alert] = "msg failed to send"
      render "index"
    end
  end

  private
  def message_params
    params.require(:message).permit(:request_id, :body, :user_id, :to_user)
  end
end
