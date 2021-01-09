class TodoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def mark_as_done?
    record.user == user
  end

  def mark_as_not_done?
    record.user == user
  end

  def move?
    record.user == user
  end

  def update_deadline?
    record.user == user
  end
end
