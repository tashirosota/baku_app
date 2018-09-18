class Admin::SessionsController < Admin::ApplicationController
  layout 'admin_login'

  def new; end

  def create
    # return redirect_to admin_path if session[:admin_id]
    if admin = Administrator.find_by(name: params[:name])
      if admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        return render ajax_redirect_to(admin_dashboard_path)
      end
    end
    render json: { authenticate: 'false'}
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end

  private

  def current_user;end
  def require_login;end
end
