class User < ApplicationRecord
  has_one :config
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.user_name = user_name
      user.image_url = image_url
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end
end
