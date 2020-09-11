class Article < ApplicationRecord
  belongs_to :user
  has_many :novels, dependent: :destroy
  accepts_nested_attributes_for :novels
  
  validates :title, :body, presence: true
end
