class Admin::EventsController < Admin::ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Event)
  end

  def show
    @event = Event.find(params[:id])
    @artists = {}
    @artists[:ok] = @event.ok_artists
    @artists[:ng] = @event.ng_artists
    @artists[:offering] = @event.offering_artists
    @artists[:candidate] = @event.candidate_artists
    @collaborators = @event.collaborative_eventers
  end
end
