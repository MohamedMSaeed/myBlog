class Post < ApplicationRecord
  belongs_to :user
  has_many :comments , dependent: :destroy
  default_scope { order(created_at: :desc) }
  validates :tilte, presence: true
  validates :body, presence: true
end
