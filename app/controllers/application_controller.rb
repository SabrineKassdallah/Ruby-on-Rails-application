class ApplicationController < ActionController::API
    include JwtToken
    before_action :authenticate_user

    def status 
        render json: { data: 'ok' } 
    end 

    private 
        def authenticate_user
          header = request.headers['Authorization']
          header = header.split('').last if header
          begin
            @decoded = JwtToken.decode(header)
            @current_user = User.find(@decoded[:user_id])
          rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
          rescue JWT::DecodedError => e
            render json: { errors: e.message }, status: :unauthorized
          end
        end
end
