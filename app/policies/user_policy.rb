class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can see a user
  end

  def create?
    true
  end

  def update?
    record.user == user
  end
end
