class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_rich_text :content
  # acts_as_taggable
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end

  mount_uploader :image, ImageUploader
end
