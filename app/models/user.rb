class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
 		:recoverable, :rememberable, :trackable, :validatable

	has_many :posts   

	has_many :subscriptions

  validates :full_name, presence: true
end
