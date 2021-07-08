class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many  :comments
  validates :content, presence: true, length: {maximum: 200}
end
