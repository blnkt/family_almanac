class User < ActiveRecord::Base
  has_many :photos
  has_many :tags, through: :photos

  has_secure_password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  has_many :photos

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
