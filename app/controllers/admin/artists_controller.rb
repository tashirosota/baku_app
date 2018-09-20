class Admin::ArtistsController < Admin::ApplicationController
  def index
    @artists = Artist.order(created_at: :desc).page(params[:page]).per(100)
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
