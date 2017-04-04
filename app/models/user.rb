class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  #DEVISE - the fullname property must be present and it max length is 50
  validates :fullname, presence: true, length: {maximum: 50}
  # For more information: http://guides.rubyonrails.org/active_record_validations.html

  has_many :rooms
  # self - is a way to get the method without initialising a new instance of the class User... so it applies to the current object
  def self.from_omniauth(auth)
    # finds the user with the email address
    user = User.where(email: auth.info.email).first

    # if user is found will return user
    if user
      return user

    else
      # this will look at the current provider (FB in this case) and if it finds it it'll return the first result and if it doesn't it will create done with: first_or_create
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end
  end


end
