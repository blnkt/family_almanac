class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture, styles: {medium: "300x300>", thumb: ["50X50#", :png] }, default_url: "/images/:style/missing.png"
  validates_attachment :picture,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
