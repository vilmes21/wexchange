class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @posts = current_user.posts.where.not(state: :exchanged)
    @number_posts = @posts.count
    @number_watched = current_user.watched_posts.count
    @number_sent = Request.where(user_id: session[:user_id]).count
    @exchanging_posts = current_user.posts.where(state: :exchanging)
    @number_exchanging = @exchanging_posts.count
    @history_posts = @user.posts.where(state: :exchanged)
    @number_history = @history_posts.count
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {
          session[:user_id] = @user.id
          session[:user_name]= @user.name
          redirect_to root_path, notice: 'Registration Successful!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :points, :location, {desired_tag_ids: []})
    end
end
