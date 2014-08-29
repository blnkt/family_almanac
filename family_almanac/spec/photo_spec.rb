require 'rails_helper'

describe Photo do
  it { should belong_to :user }
  it { should have_attached_file :pic }
  it { should validate_attachment_content_type(:pic).
                allowing('image/png').
                allowing('image/gif').
                allowing('image/jpeg').
                rejecting('text/plain', 'text/xml') }

end
