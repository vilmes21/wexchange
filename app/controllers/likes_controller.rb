class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.new
    post = Post.find params[:post_id]
    like.post = post
    like.user = current_user
    if like.save
      redirect_to post_path(post), notice: "Liked it!"
    else
      redirect_to post_path(post), alert: "Can't! Liked already!"
    end
  end

  def destroy
    like = Like.find params[:id]
    like.destroy
    redirect_to post_path(like.post), notice: "Unliked!"
  end
end
