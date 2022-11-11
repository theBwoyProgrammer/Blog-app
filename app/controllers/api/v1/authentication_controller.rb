module Api
    module V1
        class AuthenticationController < ApiController
        rescue_from ActionController::ParameterMissing, with: :parameter_missing
        before_action :authorize_request, except: [:create, :index]

        
    
        private
    
        def parameter_missing(e)
            render json: {error: e.message}, status: :unprocessable_entity
        end
        end
    end
end