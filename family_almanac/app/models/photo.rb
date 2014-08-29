class Photo < ActiveRecord::Base
  has_many :users, through: :tags
  has_many :tags
  belongs_to :user
  has_attached_file :pic,
    styles: { medium: "300x300>",
              thumb: "100X100>" }
  validates_attachment :pic,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: {in: 0..2.megabytes }

end
