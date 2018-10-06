class Admin::EventsController < Admin::ApplicationController
  def index
    @events = Event.order(created_at: :desc).page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end
end
