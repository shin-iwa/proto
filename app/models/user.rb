class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, presence: true
  # validates :image, blank: true
  has_many :tweets
  has_many :comments
  mount_uploader :image, ImageUploader
end
