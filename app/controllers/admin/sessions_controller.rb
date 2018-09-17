class Admin::SessionsController < Admin::ApplicationController
  layout 'admin_login'

  def new; end

  def create
    if admin = Administrator.find_by(name: params[:name])
      if admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_root_path
        return
      end
    end
    redirect_to admin_root_path
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end

  private

  def require_login;end
end
