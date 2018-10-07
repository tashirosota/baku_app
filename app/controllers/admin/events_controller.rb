class Admin::EventsController < Admin::ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Event)
  end

  def show
    @event = Event.find(params[:id])
    # ハッシュで状態ごとに取得する
    @offer_artists = @event.offers&.map{|o| o.artist}
    @collaborators = @event.collaborators&.map{|c| c.eventer}
  end
end
