class HomesController < ApplicationController
  before_action only: [:watches, :messages, :user_requests] do
    authenticate_user!
  end

  def home
  end

  def about
  end

  def messages
    @posts = current_user.posts

  end

  def watches
    @watched_posts = current_user.watched_posts
    @number_watched = current_user.watched_posts.count

  end

  def user_requests
    @user_requests = Request.where(user_id: session[:user_id])
    @number_sent = @user_requests.count
  end

  def owner_confirm
    post = Post.find params[:post_id]
    post.status = "Exchanging"
    post.working_request_id = params[:request_id]

    request = Request.find params[:request_id]
    request.status = "Exchanging"

    declined_requests = post.requests.where(status: "Pending")
    declined_requests.each do |dr|
      dr.status = "Declined"
      dr.save
    end

    if post.save && request.save
      redirect_to user_path(session[:user_id]), notice: "Request accepted. Exchange in progress!"
    else
      render messages_path
      flash[:alert] = "Acceptance failed."
    end
  end

end
