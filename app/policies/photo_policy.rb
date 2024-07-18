class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end
  def create?
    true
  end
  def show?
    user == photo.owner || !photo.owner.private? || photo.owner.followers.include?(user)
  end
  def index?
    false
  end
  def edit?
    destroy?
  end
  def update?
    destroy?
  end
  def destroy?
    photo.owner == user
  end
end
