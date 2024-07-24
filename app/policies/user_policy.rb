class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def liked?
    show?
  end
  def feed?
    true
  end
  def discover?
    user == current_user
  end 
  def show?
    true
  end
  def create?
    true
  end

  def show_photo?
    !user.private? || user.followers.include?(current_user) || current_user == user
  end
  def update?
    discover?
  end
  def destroy?
    discover?
  end
end
