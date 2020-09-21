class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title,:text, presence: true
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('title LIKE(?)', "%#{search}%")
  end
end
