require 'rails_helper'

describe Tag do
  it { should belong_to :user }
  it { should belong_to :photo }
  it { should validate_uniqueness_of :user_id }
end
