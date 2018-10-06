class Admin::EventersController < Admin::ApplicationController
  def index
    @eventers = Eventer.order(created_at: :desc).page(params[:page])
  end

  def show
    @eventer = Eventer.find(params[:id])
  end
end
