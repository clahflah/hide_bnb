class ListingsPolicy < ApplicationPolicy
  class Scope < Scope
    scope.all
  end

  def show
    true
  end

  def create
    true
  end

  def destroy
    record.user == user
  end
end
