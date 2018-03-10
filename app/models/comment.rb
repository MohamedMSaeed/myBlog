class Comment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :post
  default_scope { order(created_at: :desc) }

  validates :body, presence: true
end
