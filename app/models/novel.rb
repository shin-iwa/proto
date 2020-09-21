class Novel < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :title, :body, presence: true
end
