class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end
end
