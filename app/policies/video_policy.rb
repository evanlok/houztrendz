class VideoPolicy < ApplicationPolicy
  def create?
    user == record.user
  end

  alias_method :update?, :create?
  alias_method :update?, :destroy?
end
