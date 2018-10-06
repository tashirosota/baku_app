class Admin::EventersController < Admin::ApplicationController
  def index
    @q = Eventer.ransack(params[:q])
    @eventers = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Eventer)
  end

  def show
    @eventers = Eventer.find(params[:id])
  end
end
