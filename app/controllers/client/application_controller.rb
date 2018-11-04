class Client::ApplicationController < ApplicationController
  include AjaxHelper
  protect_from_forgery except: :create
  before_action :require_login, :current_user
  layout 'client'

  private
  
  def current_user
    @current_user = Eventer.find(session[:eventer_id])
  end

  def require_login
    redirect_to login_path unless session[:eventer_id]
  end
end
