class PostSerializer < ActiveModel::Serializer
  attributes :title, :text

  has_many :comments
  belongs_to :user
end
