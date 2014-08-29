class Photo < ActiveRecord::Base
  # attr_accessor :picture_file_name, :pic_content_type, :pic_file_size, :pic_updated_at
  belongs_to :user
  has_attached_file :pic,
    styles: { medium: "300x300>",
              thumb: "50X50>" }
  validates_attachment :pic,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: {in: 0..2.megabytes }

end
