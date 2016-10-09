class BuyerConfirmationsController < ApplicationController
  def create
    # post 1 state update:
    post = Post.find params[:offer_id]
    post.complete
    post.save

    # state of the request update:
    request = Request.find post.working_request_id
    request.complete
    request.save

    # post 2 state update:
    post2 = Post.find request.post_id
    post2.complete
    post2.save
  end
end
