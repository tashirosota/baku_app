class Admin::ApplicationController < ApplicationController
  include AjaxHelper
  include Banken
  protect_from_forgery except: :create
  before_action :require_login, :current_user, :set_news
  layout 'admin'

  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized


  private

  def current_user
    @current_user = Administrator.find(session[:admin_id])
  end

  def require_login
    redirect_to admin_login_path unless session[:admin_id]
  end

  #ページネーションで件数を表示したい時
  def pagination_count(model)
    @total_records = model.count
    # 最初のページの場合　params[:page]}　が存在しないので　1ページ目とする。
    params[:page].blank? ? @current_page = 1 :  @current_page  = params[:page].to_i
    if @current_page == 0 then @current_page += 1 end
    @current_start = Kaminari.config.default_per_page * (@current_page - 1 ) + 1
    @current_end   = @current_start + Kaminari.config.default_per_page - 1
  end

  def user_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore

    flash[:error] = t "#{loyalty_name}.#{exception.query}", scope: 'banken', default: :default
    render 'not_authorized'
  end

  def set_news
    @new_records = {}
    @new_records[:eventers] = Eventer.get_new_records
    @new_records[:events] = Event.get_new_records
    @new_records[:artists] = Artist.get_new_records
    def @new_records.has_record?
      !!(self[:eventers]&.count + self[:events]&.count + self[:artists]&.count)
    end
    @new_records
  end
end
