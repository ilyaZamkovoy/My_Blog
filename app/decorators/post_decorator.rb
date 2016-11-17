class PostDecorator < ApplicationDecorator
  delegate :title

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #

  def truncated_text
  	h.truncate(object.text, length: 10)
  end
  def title
    object.title
  end
  def text
  	object.text
  end
  def user
  	object.user
  end
  def comments
  	object.comments
  end
  def id
  	object.id
  end
end

