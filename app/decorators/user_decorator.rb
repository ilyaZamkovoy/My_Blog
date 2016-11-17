class UserDecorator < ApplicationDecorator

  def full_name_with_email(user)
    "#{user.full_name} (#{user.email})"
  end
  def full_name
  	object.full_name
  end
  def email
  	object.email
  end
  def posts
  	object.posts
  end
  def id
  	object.id
  end
end
