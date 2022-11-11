class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  def self.call(id)
    payload = { user_id: id }
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end

  def self.decode(token)
    decoded = JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256' }
    HashWithIndifferentAccess.new decoded[0]
  end
end
