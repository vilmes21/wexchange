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
end
