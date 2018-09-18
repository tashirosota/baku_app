class Admin::ApplicationController < ApplicationController
  include AjaxHelper

  protect_from_forgery except: :create
  before_action :require_login, :current_user
  layout 'admin'

  private

  def current_user
    @current_user = Administrator.find(session[:admin_id])
  end

  def require_login
    redirect_to admin_login_path unless session[:admin_id]
  end
end