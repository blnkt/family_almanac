class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :name

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
