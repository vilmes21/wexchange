class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    (redirect_to new_session_path, alert: "Please sign in first") unless user_signed_in?
  end
  helper_method :authenticate_user!

  def suggestions
    wishes = current_user.desired_tag_ids
    # Collect an array of post_ids
    post_ids = Tagging.where(tag_id: wishes).pluck(:post_id).uniq
    # Fetch these posts by passing the array of ids.
    @suggestions = Post.where(id: post_ids)
  end
  helper_method :suggestions

end
