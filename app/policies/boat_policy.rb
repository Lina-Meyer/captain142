class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def home?
    true
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

end
