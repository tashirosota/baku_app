class Admin::PasswordController < Admin::ApplicationController
  def edit; end

  def update
    if current_password?
      return redirect_to admin_root_path if @current_user.update(admin_params)
    end
    render :edit
  end

  private

  def current_password?
    !!current_user.authenticate(params[:current_password])
  end

  def admin_params
    params.require(:administrator).permit(:password, :password_confirmation)
  end
end
