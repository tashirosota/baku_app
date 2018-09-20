class Admin::OffersController < Admin::ApplicationController
  def index
    @offers = Offer.order(created_at: :desc).page(params[:page]).per(100)
  end
end
