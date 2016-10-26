class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :subscriptions, dependent: :destroy

  validates :full_name, presence: true
end
