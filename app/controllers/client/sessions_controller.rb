class Client::SessionsController < Client::ArtistsController
    layout 'client_login'

  def new; end

  def create
    return redirect_to root_path if session[:eventer_id]
    if eventer = Eventer.find_by(name: params[:name])
      if eventer.authenticate(params[:password])
        session[:eventer_id] = eventer.id
        return render ajax_redirect_to(root_path)
      end
    end
    render json: { authenticate: 'false' }
  end

  def destroy
    session[:eventer_id] = nil
    redirect_to login_path
  end

  private

  def current_user; end

  def require_login; end
end
