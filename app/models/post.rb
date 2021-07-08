class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :content, presence: true, length: {maximum: 200}
end
