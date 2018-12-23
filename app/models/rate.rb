class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: Settings.rate.minimum_rate,
    less_than_or_equal_to: Settings.rate.maximum_rate
  }
  delegate :name, to: :user, prefix: true, allow_nil: true
end
