class CommentSerializer < ActiveModel::Serializer
  attributes :text, :post_id, :blabla

  def blabla
    byebug
  end
end
