class Api::V1::PostsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json

  def show
    @post = Post.search(params.fetch(:qs, ""))
  end
end
