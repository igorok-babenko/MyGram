class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many  :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  validates :content, presence: true, length: {maximum: 200}

  belongs_to :user
end
