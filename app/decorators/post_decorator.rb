class PostDecorator < ApplicationDecorator
  delegate :title, :text, :user, :comments, :id

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #

  def truncated_text
    h.truncate(object.text, length: 10)
  end
end
