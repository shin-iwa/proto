class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
  validates :nickname, :email, :encrypted_password, presence: true
=======
  validates :nickname, presence: true
>>>>>>> parent of 7e3da28... change
  has_many :tweets
  has_many :comments
end
