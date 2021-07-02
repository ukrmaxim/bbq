class EventPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def update?
    user_is_owner?(record)
  end

  def show?
    true
  end

  private

  def user_is_owner?(event)
    user.present? && (event.try(:user) == user)
  end

    class Scope < Scope
    def resolve
      scope.all
    end
  end
end
