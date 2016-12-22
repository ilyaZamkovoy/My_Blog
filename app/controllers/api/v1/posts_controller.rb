module Api
  module V1
    class PostsController < ApplicationController
      expose :post

      def show
        respond_with post
      end

      def create
        post = @current_user.posts.new(post_params)
        if post.save
          respond_with(post, serializer: PostSerializer)
        else
          render status: 422
        end
      end

      def index
        posts = @current_user.posts
        render json: posts
      end

      def update
        @post = Post.find(params[:id])
        # authorize post
        byebug
        respond_with(@post)

        # if post.update(post_params)
        #   respond_with(post, serializer: PostSerializer)
        # else
        #   render status: 401
        # end
      end

      def destroy
        authorize post
        if post.destroy
          respond_with post
        else
          render status: 401
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :text)
      end
    end
  end
end
