class ItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def new?
  end

  def create?
    user.present?
  end

  def update?
    create?
  end
end