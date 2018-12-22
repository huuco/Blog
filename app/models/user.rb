class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  scope :sort_by_name, -> {select(:id, :name, :email, :phone, :avatar).order(name: :asc)}
  enum role: %i(normal admin)
end
