class Admin::AdministratorsLoyalty < ApplicationLoyalty
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    over_admin_level?
  end

  def show?
    over_admin_level?
  end

  def create?
    over_admin_level?
  end

  def new?
    over_admin_level?
  end

  def update?
    over_admin_level?
  end

  def edit?
    over_admin_level?
  end

  def destroy?
    over_admin_level?
  end
end
