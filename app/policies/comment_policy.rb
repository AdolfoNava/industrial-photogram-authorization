class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end
  def show?
    true
  end
  def create?
    true
  end

  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it
  def edit?
    destroy?
  end
  def update?
    destroy?
  end
  def destroy?
    @comment.author == user
  end
end
