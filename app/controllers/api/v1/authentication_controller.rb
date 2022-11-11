module Api
  module V1
    class AuthenticationController < ApiController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      before_action :authorize_request, except: %i[create index]

      def create
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
          token = AuthenticationTokenService.call(user.id)
          render json: { token: }, status: :created
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
