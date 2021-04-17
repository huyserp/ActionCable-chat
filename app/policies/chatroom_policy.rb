class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    if !user.nil?
  end

  def destroy?
    if user == record.user
  end
end
