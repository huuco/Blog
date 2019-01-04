class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :rates, dependent: :destroy
  validates :title, presence: true, length: {maximum: Settings.post.maximum_title}
  validates :content, presence: true
  validates :user, presence: true
  validates :category, presence: true
  enum status: %i(watting approved rejected)
  mount_uploader :picture, PictureUploader
  delegate :name, to: :category, prefix: true, allow_nil: true
  scope :sort_by_updated, -> {order(updated_at: :asc)}
  scope :post_filter, ->{where("status = ?", "1")}
  scope :admin_filter_category, -> (category_id){includes(:category).where(category_id: category_id)}
  scope :show_post_host,
   -> {select("posts.*, avg(rates.star) as average_rate, count(rates.id) as number_of_rate ")
    .joins(:rates).where("posts.created_at >= ? and posts.updated_at >= ? ",
     Date.today.beginning_of_week, Date.today.beginning_of_week)
    .group("posts.id").order("average_rate DESC").limit(3)}

  scope :show_blog_category_interested,
    ->{select("posts.*, avg(rates.star) as average_rate, count(rates.id) as number_of_rate ")
    .joins(:rates)
    .group("posts.id").order("average_rate DESC").limit(3)}
end
