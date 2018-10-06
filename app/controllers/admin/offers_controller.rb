class Admin::OffersController < Admin::ApplicationController
  def index
    @q = Offer.ransack(params[:q])
    @offers = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Offer)
  end
end
