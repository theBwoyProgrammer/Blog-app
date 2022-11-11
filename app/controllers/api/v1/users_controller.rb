module Api
  module V1
    class UsersController < AuthenticationController
      def index
        @users = User.all
        render json: @users
      end

      def create
        @user = User.new(user_params)
    
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      def user_params
        params.permit(:name, :email, :bio, :photo, :password, :password_confirmation)
      end


      def show
        @user = User.find(params[:id])
        render json: @user
      end
    end
  end
end
