module Api
  module V1
    class CommentsController < AuthenticationController
      def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end

      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.author_id = params[:user_id]
        render json: @comment, status: :created if @comment.save
      end

      private

      def comment_params
        params.permit(:text)
      end
    end
  end
end
