class Admin::EventsController < Admin::ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Event)
  end

  def show
    @events = Event.find(params[:id])
  end
end
