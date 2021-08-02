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
    user_is_owner?
  end

  def show?
    record.pincode.blank? || user_is_owner? || record.pincode_valid?(cookies["event_#{record.id}_pincode"])
  end

  private

  def user_is_owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
