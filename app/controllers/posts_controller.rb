class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    # @posts = Post.all
    @service_posts = Post.where(category: 'Service').order(created_at: :desc)
    @item_posts = Post.where(category: 'Item').order(created_at: :desc)
    @volunteer_posts = Post.where(category: 'Volunteer').order(created_at: :desc)
  end

  def show
    @number_watched = current_user.watched_posts.count
    @watcher_number = Watch.where(post_id: @post.id).count
    @likes_number = Like.where(post_id: @post.id).count
    @request = Request.new
    @bigarray = []
    current_user.posts.each do |p|
      smallarray = []
      2.times {smallarray << p.title}
      @bigarray << smallarray
    end
  end

  def new
    authenticate_user!
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :description, :category, :value, :user_id, :location, :exchanged_post_id, :duration, :time, {tag_ids: []})
    end
end
