class Tweet < ApplicationRecord
  # validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_rich_text :content
  has_one_attached :avatar

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('content LIKE(?)', "%#{search}%")
  end
  mount_uploader :image, ImageUploader
end
