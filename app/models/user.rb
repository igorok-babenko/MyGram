class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :posts

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :bio, presence: true
end
