class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Only signed in users
  end

  def create?
    true
  end

  def update?
    record.user == user
  end
end