class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {maximum: Settings.post.maximum_title}
  validates :content, presence: true
  validates :user, presence: true
  mount_uploader :picture, PictureUploader
  scope :sort_by_updated, -> {order(updated_at: :asc)}

  def list_categories= names
    self.categories = names.split(",").map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end

  def list_categories
    self.categories.map(&:name).join(",")
  end
end
