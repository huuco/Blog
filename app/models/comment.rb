class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  validates :user, presence: true
  validates :post, presence: true
  validates :content, presence: true
  attr_accessor :name, :body
end
