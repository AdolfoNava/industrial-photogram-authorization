class FollowRequestPolicy < ApplicationPolicy
  attr_reader :follow_request, :user

  def initialize(follow_request, user)
    @follow_request = follow_request
    @user = user
  end

  def show?
    true
  end

  def create?
    follow_request.sender == user
  end
  def edit?
    follow_request.recipient == user || follow_request.sender == user
  end
  def update?
    edit?
  end
  def destroy?
    edit?
  end
end
