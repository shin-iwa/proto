class Article < ApplicationRecord
  # validates :title, :body, presence: true
  # belongs_to :tweet
  belongs_to :user
end
