class Admin::EventersController < Admin::ApplicationController
  def index
    @eventers = Eventer.order(created_at: :desc).page(params[:page]).per(100)
  end

  def show
    @eventer = Eventer.find(params[:id])
  end
end
