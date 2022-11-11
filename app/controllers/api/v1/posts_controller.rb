module Api
  module V1
    class PostsController < AuthenticationController
      before_action :fetch_user, only: %i[index show]
      before_action :authorize_request

      def index
        @posts = current_user ? current_user.posts.includes(:comments) : Post.includes(:comments)
        render json: @posts
      end

      private

      def fetch_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
