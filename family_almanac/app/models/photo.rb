class Photo < ActiveRecord::Base

  belongs_to :user
  has_attached_file :pic,
    styles: { medium: "300x300>",
              thumb: "100X100>" }
  validates_attachment :pic,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: {in: 0..2.megabytes }

end
