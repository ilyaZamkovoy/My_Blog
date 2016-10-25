class PostsController < ApplicationController
  respond_to :html

  expose :post
  expose :posts, -> { Post.page(params[:page]) }

  def create
    post.save
    respond_with(post)
  end

  def update
    post.update_attributes(post_params)
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
