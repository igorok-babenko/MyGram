class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many  :comments, dependent: :destroy

  has_many :likes

  validates :content, presence: true, length: {maximum: 200}

  belongs_to :user
end
