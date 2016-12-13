class PostPolicy < ApplicationPolicy
  def update?
    user_is_owner_of_record?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_owner_of_record?
    @user == @record.user
  end
end
