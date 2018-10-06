class Admin::ArtistsController < Admin::ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Artist)
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
