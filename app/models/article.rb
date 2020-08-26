class Article < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :tweet, optional: true
end
