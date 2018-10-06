class Admin::ArtistsController < Admin::ApplicationController
  def index
    @artists = Artist.order(created_at: :desc).page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
