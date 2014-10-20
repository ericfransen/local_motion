module AuthenticationHelpers
  def mock_auth_hash
    OmniAuth.config.mock_auth[:uber] = OmniAuth::AuthHash.new({
        :provider => 'uber',
        :uid => '123545',
        :info => {
          :first_name => "Bob",
          :last_name => "Roberts",
          :email => "bob@roberts.com",
          :picture_url => "https://d297l2q4lq2ras.cloudfront.net/nomad/2014/10/9/21/480x480_id_95dd3b12-ccbb-41e9-838e-ed94b77bb7a4.jpeg"
        }
      })
  end

  def auth_failure
    OmniAuth.config.mock_auth[:uber] = :invalid_credentials
  end
end

RSpec.configure do |config|
  config.include(AuthenticationHelpers)
end
