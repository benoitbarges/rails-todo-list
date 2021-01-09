class TodoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
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
end
