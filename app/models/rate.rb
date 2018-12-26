class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: Settings.rate.minimum_rate,
    less_than_or_equal_to: Settings.rate.maximum_rate
  }
  validates :content, presence: true,
   length: {maximum: Settings.rate.maximum_content}
  delegate :name, to: :user, prefix: true, allow_nil: true
end
