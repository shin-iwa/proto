class Tweet < ApplicationRecord
  validates :title,:text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  # has_rich_text :content
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end

  mount_uploader :image, ImageUploader
end
