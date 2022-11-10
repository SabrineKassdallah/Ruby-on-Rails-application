class AuthenticationController < ApplicationController
  # skip_before_action  :authenticate_user

  # POST /auth/login
  def login
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: {error: {message: 'EMAIL_NOT_FOUND'}}, status: :unauthorized
    # elsif user.valid_password?(params[:password])
    #   render json: payload(user)
    # else
    #   render json: {error: {message: 'INVALID_PASSWORD'}}, status: :unauthorized
    # end
    else
      render json: payload(user)
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        user: {
            id: user.id,
            name: user.username
        }
    }
  end
end
