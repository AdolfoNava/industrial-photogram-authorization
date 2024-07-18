class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def feed?
    true
  end
  def show?
    true
  end
  def show_photo?
    !user.private? || user.followers.include?(current_user) || current_user == user
  end
  def discover?
    true
  end 
end
