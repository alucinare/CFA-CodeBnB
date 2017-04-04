module ApplicationHelper

# a way to create icons for people to use as their avatars beside their user profile. Here is more info about it: http://en.gravatar.com/site/implement/images/
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    # An if branch to return the user imgae from face book otherwise the gravatar image. I've taken this out because the FB image isn't loading, I'm not sure why.
    # if user.image
    #   user.image
    # else
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?f=y&s=150"
    # end
  end
end
