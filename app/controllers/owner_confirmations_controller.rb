class OwnerConfirmationsController < ApplicationController
  before_action :authenticate_user!

  def create
    # post 1 state update:
    post = Post.find params[:post_id]
    post.exchanging
    post.working_request_id = params[:request_id]
    post.save

    # state of the request update:
    request = Request.find params[:request_id]
    request.accept
    request.save

    # post 2 state update:
    post2 = Post.find request.offer
    post2.exchanging
    post2.working_request_id = params[:request_id]
    post2.save

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
    Request.where(offer: post.id).each do |ro|
      if ro.may_cancel?
        ro.cancel
        ro.save
      end
    end

    # cancel all other requests that offered post2
    Request.where(offer: post2.id).each do |ro|
      if ro.may_cancel?
        ro.cancel
        ro.save
      end
    end

    @errors = post.errors.full_messages + post2.errors.full_messages
  end
end
