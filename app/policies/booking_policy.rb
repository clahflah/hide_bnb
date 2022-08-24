class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: user)
      scope.all
      user.admin? ? scope.all : scope.where(user: user) || scope.where(id == @listing.id)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user = user
  end

  def destroy?
    record.user = user
  end
end
