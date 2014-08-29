require 'rails_helper'

describe User do

  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :username }
  it { should have_secure_password }
  it { should have_many :photos}
end
