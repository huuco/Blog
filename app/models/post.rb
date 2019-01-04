class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :rates, dependent: :destroy
  validates :title, presence: true, length: {maximum: Settings.post.maximum_title}
  validates :content, presence: true
  validates :user, presence: true
  validates :category_ids, presence: true
  enum status: %i(watting approved rejected)
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

  scope :show_post_host,
   -> {select("posts.id, avg(rates.star) as average_rate, count(rates.id) as number_of_rate ")
    .joins(:rates)
    .where("posts.created_at >= ? and posts.updated_at >= ?", Date.today.beginning_of_week, Date.today.beginning_of_week)
    .group("posts.id").order("average_rate DESC").limit(3)}
  scope :show_blog_category_interested,
    ->{select("posts.id, avg(rates.star) as average_rate, count(rates.id) as number_of_rate ")
    .joins(:rates).group("posts.id").order("average_rate DESC")}
  def send_new_post
    PostMailer.perform_in(Settings.delay_times.seconds, id)
    AdminPostsWorker.perform_in(Settings.delay_times.seconds, id)
  end
end
