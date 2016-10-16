class WatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    watch = Watch.new
    post = Post.find params[:post_id]
    watch.post = post
    watch.user = current_user
    if watch.save
      redirect_to post_path(post), notice: "Watching it!"
    else
      redirect_to post_path(post), alert: "Can't! Watched already!"
    end
  end

  def index
    @watched_posts = current_user.watched_posts
  end

  def destroy
    watch = Watch.find params[:id]
    watch.destroy
    redirect_to post_path(watch.post), notice: "No longer watching!"
  end
end
