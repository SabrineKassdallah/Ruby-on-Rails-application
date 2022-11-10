class JsonWebToken
  def self.encode(payload)
    payload[:exp] = (5).day.from_now.to_i #expire in 5 days
    JWT.encode(payload, Rails.application.secret_key_base
)
  end

  def self.decode(token)
    auth_token = JWT.decode(token, Rails.application.secret_key_base)
    return ActionController::Parameters.new(auth_token[0]).permit!
  rescue
    nil
  end
end