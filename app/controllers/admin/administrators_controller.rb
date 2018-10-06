class Admin::AdministratorsController < Admin::ApplicationController
  protect_from_forgery with: :null_session

  def index
    @q = Administrator.ransack(params[:q])
    @administrators = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Administrator)
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
    return render :edit unless target_administrator.update(admin_params)
    redirect_to admin_administrators_path, notice: 'Administrator updated successfully.'
  end

  def destroy
    message = if target_administrator.role == 'root'
                'root管理者は削除できません。'
              elsif target_administrator == current_user
                '自分自身の削除はできません。'
              else
                target_administrator.destroy ? 'Administrator deleted successfully.' : 'Administrator deleted unsuccessfully.'
              end
    redirect_to admin_administrators_path, notice: message
  end

  private

  def admin_params
    params.require(:administrator).permit(:name, :password, :password_confirmation, :role)
  end

  def target_administrator
    @administrator = Administrator.find(params[:id])
  end
end
