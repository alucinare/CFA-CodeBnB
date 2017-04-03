class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #DEVISE - the fullname property must be present and it max length is 50
  validates :fullname, presence: true, length: {maximum: 50}
  # For more information: http://guides.rubyonrails.org/active_record_validations.html
end
