class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user, presence: true
  validates :post, presence: true
  def liked? post_id
    current_user.likes.find_by(post_id: post_id).present?
  end
end
