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
    @suggestions = Tagging.where(tag_id: current_user.desired_tag_ids).pluck(:post_id).uniq.map {|id| Post.find(id)}
    # current_user.desired_tags.each do |t|
    #   Post.find_each do |p|
    #     @suggestions << p if p.tags.include? t
    #   end
    # end
    # @suggestions.uniq
  end
  helper_method :suggestions

end
