module FakerOmniAuth
  def mock_auth_hash(opts = {})
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: opts[:uid] || SecureRandom.hex(8),
      info: {
        image: opts[:image] || FFaker::Avatar.image
      },
      credentials: {
        token: opts[:token] || SecureRandom.hex(32),
        secret: opts[:secret] || SecureRandom.hex(32)
      }
    })
  end
end

RSpec.configure do |config|
  config.include FakerOmniAuth
end

OmniAuth.config.test_mode = true
