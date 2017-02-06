class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]

  def index
    @requests = Request.where(post_id: params[:post_id])
  end

  def show
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.post = Post.find params[:post_id]
      if @request.save
        redirect_to user_path(current_user), notice: 'Request Successful!'
      else
        redirect_to post_path(@request.post), alert: 'Request failure'
      end
  end

  def destroy
    @request.destroy
    redirect_to post_path(@request.post), notice: 'Message destroyed.'
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:title, :message, :offer_id)
    end
end
