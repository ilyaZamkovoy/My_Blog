class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :subscriptions, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :full_name, presence: true

  before_create :add_token

  private

  def add_token
    self.auth_token = SecureRandom.hex
  end
end
