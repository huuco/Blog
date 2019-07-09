class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :content, presence: true,
   length: {maximum: 100}
  delegate :name, to: :user, prefix: true, allow_nil: true

end
