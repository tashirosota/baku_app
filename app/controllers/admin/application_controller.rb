class Admin::ApplicationController < ApplicationController
  protect_from_forgery except: :create
  before_action :require_login
  layout 'admin'

  def current_user
    @current_user = Administrator.find(session[:admin_id])
  end

  private

  def require_login
    redirect_to admin_login_path unless session[:admin_id]
  end
end