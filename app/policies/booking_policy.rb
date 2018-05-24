class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def accept?
    record.user == user
  end

  def decline?
    record.user == user
  end
end
