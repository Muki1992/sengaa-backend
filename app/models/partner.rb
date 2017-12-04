class Partner < ApplicationRecord
  has_attached_file :image, styles: {
      thumb: '50x50>',
      square: '200x200#',
      medium: '300x300>'
  }
  has_many :awards


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
