class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, presence: true
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :novels, dependent: :destroy

  def self.search(search)
    return User.all unless search
    User.where('nickname LIKE(?)', "%#{search}%")
  end
end
