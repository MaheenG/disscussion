class DiscussionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner_or_admin?
    user.present? && (user.admin? || record.user_id == user.id)
  end
end 