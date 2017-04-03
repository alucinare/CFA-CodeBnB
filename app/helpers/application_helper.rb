module ApplicationHelper

# a way to create icons for people to use as their avatars beside their user profile. Here is more info about it: http://en.gravatar.com/site/implement/images/
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?f=y&s=150"

  end
end
