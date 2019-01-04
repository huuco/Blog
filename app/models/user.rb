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
  scope :sort_by_name, -> {select(:id, :name, :email, :phone, :avatar).order(name: :asc)}
  enum role: %i(normal admin)

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = "password"
        user.avatar = auth.info.image
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
end
