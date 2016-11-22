class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :subscriptions, dependent: :destroy

  has_many :comments, dependent: :destroy

  validates :full_name, presence: true

  after_create :add_token

  private

  def add_token
    return if token.present?
    self.token = SecureRandom.hex
  end
end
