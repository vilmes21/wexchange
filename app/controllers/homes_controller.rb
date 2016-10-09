class HomesController < ApplicationController
  before_action only: [:watches, :messages, :user_requests] do
    authenticate_user!
  end

  def home
  end

  def about
  end

  def received_requests
    # @posts = current_user.posts
    @requests ||= Request.where(to_user: session[:user_id])
    @pending_requests = @requests.where(state: :pending)
    @accepted_requests = @requests.where(state: :accepted)
    @declined_requests = @requests.where(state: :declined)
    @cancelled_requests = @requests.where(state: :cancelled)
    @completed_requests = @requests.where(state: :completed)
  end

  def watches
    @watched_posts = current_user.watched_posts
    @number_watched = current_user.watched_posts.count
  end

  def user_requests
    @user_requests ||= Request.where(user_id: session[:user_id])
    @number_sent = @user_requests.count

    @pending_requests = @user_requests.where(state: :pending)
    @accepted_requests = @user_requests.where(state: :accepted)
    @declined_requests = @user_requests.where(state: :declined)
    @cancelled_requests = @user_requests.where(state: :cancelled)
    @completed_requests = @user_requests.where(state: :completed)
  end

  def reset_confirm
    Post.where.not(state: :available).find_each do |x|
      x.state = :available
      x.working_request_id = nil
      x.save
    end

    Request.find_each do |x|
      unless x.pending?
        x.state = :pending
        x.save
      end
    end

    Message.destroy_all
  end

end
