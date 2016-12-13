class CommentSerializer < ActiveModel::Serializer
  attributes :text

  belongs_to :user
  belongs_to :post
end
