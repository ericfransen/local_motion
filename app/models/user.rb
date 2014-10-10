class User < ActiveRecord::Base
  has_many :trips
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth.info.email
      # user.picture = auth.info.picture
    end
  end
end
