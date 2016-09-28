class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :destroy]

  def index
    # @requests = Request.all
    @requests = Request.where(post_id: params[:post_id])
  end

  def show
  end

  # def new
  #   @request = Request.new
  # end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.post = Post.find params[:post_id]
      if @request.save
        redirect_to root_path, notice: 'Request Successful!'
      else
        render 'post/show', alert: 'Request failure'
      end
  end

  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Message destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:title, :message, :offer)
    end

end
