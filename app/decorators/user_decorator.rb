class UserDecorator < ApplicationDecorator
  delegate :full_name, :email, :posts, :id

  def full_name_with_email(user)
    "#{user.full_name} (#{user.email})"
  end
end
