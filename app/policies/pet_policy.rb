  class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can see a pet
  end

  def create?
    true
  end

  def update?
    true
  end
end
