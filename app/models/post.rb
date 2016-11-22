class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  def self.latest
    limit(12).order(created_at: :desc).includes(:user)
  end
end
