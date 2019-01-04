class Category < ApplicationRecord
  has_many :posts
  validates :name, presence: true,  uniqueness: {case_sensitive: false}

  scope :by_created_at, -> {order(created_at: :desc)}
end
