class Article < ApplicationRecord
  belongs_to :user
  has_many :novels, dependent: :destroy
  has_many :impressions, dependent: :destroy
  accepts_nested_attributes_for :novels
  # accepts_nested_attributes_for :impressions
  
  validates :title, :body, presence: true

  def self.search(search)
    return Article.all unless search
    Article.where('title LIKE(?)', "%#{search}%")
  end

end
