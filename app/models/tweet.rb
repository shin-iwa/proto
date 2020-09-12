class Tweet < ApplicationRecord
  validates :title,:text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('title LIKE(?)', "%#{search}%")
  end

end
