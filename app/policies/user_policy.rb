class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end
  def authorize?
    true
  end
  def feed?
    true
  end
end
