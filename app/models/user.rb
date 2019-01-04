class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,:omniauthable, omniauth_providers: [:facebook]
  has_many :posts, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  scope :filter_created_at, -> {order(created_at: :desc)}
  scope :sort_by_name, -> {select(:id, :name, :email, :phone, :avatar).order(name: :asc)}
  enum role: %i(normal admin)

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = "password"
        user.oauth_token = auth.credentials.token
        user.uid = auth.uid
        user.remote_avatar_url = auth.info.image.gsub('http', 'https')
      end
    end
  end
  def new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def facebook
    @facebook ||= Koala::Facebook::API.new oauth_token
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end
end
