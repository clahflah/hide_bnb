class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
