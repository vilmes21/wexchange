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

  # def owner_confirm
  #   post = Post.find params[:post_id]
  #   post.status = "Exchanging"
  #   post.working_request_id = params[:request_id]
  #
  #   request = Request.find params[:request_id]
  #   request.status = "Exchanging"
  #
  #   declined_requests = post.requests.where(status: "Pending")
  #   declined_requests.each do |dr|
  #     dr.status = "Declined"
  #     dr.save
  #   end
  #
  #   if post.save && request.save
  #     redirect_to user_path(session[:user_id]), notice: "Request accepted. Exchange in progress!"
  #   else
  #     render messages_path
  #     flash[:alert] = "Acceptance failed."
  #   end
  # end

  def owner_confirm
    # post 1 state update:
    post = Post.find params[:post_id]
    post.exchanging
    post.working_request_id = params[:request_id]

    # state of the request update:
    request = Request.find params[:request_id]
    request.accept
    request.save

    # post 2 state update:
    post2 = Post.find request.offer
    post2.exchanging
    post2.working_request_id = params[:request_id]

    # decline all other requests to post1:
    post.requests.find_each do |pr|
      if pr.may_decline?
        pr.decline
        pr.save
      end
    end

    # decline all other requests to post2:
    post2.requests.find_each do |pr|
      if pr.may_decline?
        pr.decline
        pr.save
      end
    end

    # cancel all other requests that offered post1
    Request.where(offer: :post.id).each do |ro|
      if ro.may_cancel?
        ro.cancel
        ro.save
      end
    end

    # cancel all other requests that offered post2
    Request.where(offer: :post2.id).each do |ro|
      if ro.may_cancel?
        ro.cancel
        ro.save
      end
    end

    if post.save
      redirect_to user_path(session[:user_id]), notice: "Request accepted. Exchange locked between you two!"
    else
      render messages_path
      flash[:alert] = "Acceptance failed."
    end
  end


end
