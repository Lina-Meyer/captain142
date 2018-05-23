class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def own_boats?
    true
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

end
