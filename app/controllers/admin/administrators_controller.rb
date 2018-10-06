class Admin::AdministratorsController < Admin::ApplicationController
  protect_from_forgery with: :null_session

  def index
    @administrators = Administrator.order(created_at: :desc).page(params[:page])
  end

  def new
    @administrator = Administrator.new
  end

  def create
    @administrator = Administrator.new(admin_params)
    return render :new unless @administrator.save
    redirect_to admin_administrators_path, notice: 'Administrator created successfully.'
  end

  def edit; end

  def update
    return render :edit unless @administrator.update(admin_params)
    redirect_to admin_administrators_path, notice: 'Administrator updated successfully.'
  end

  def destroy
    message = if @administrator.id == 1
                'root管理者は削除できません。'
              else
                @administrator.destroy ? 'Administrator deleted successfully.' : 'Administrator deleted unsuccessfully.'
              end
    redirect_to admin_administrators_path, notice: message
  end

  private

  def admin_params
    params.require(:administrator).permit(:name, :password, :password_confirmation, :role)
  end

  def current_administrator
    @administrator = Administrator.find(params[:id])
  end
end
