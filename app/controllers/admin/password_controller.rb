class Admin::PasswordController < Admin::ApplicationController
  def edit; end

  def update
    if current_password?
      return redirect_to admin_root_path, notice: 'パスワード変更に成功しました.' if @administrator.update(admin_params)
    end
    render :edit, notice: 'パスワード変更に失敗しました.'
  end

  private

  def current_password?
    !!current_user.authenticate(params[:current_password])
  end

  def admin_params
    params.require(:administrator).permit(:password, :password_confirmation)
  end
end
