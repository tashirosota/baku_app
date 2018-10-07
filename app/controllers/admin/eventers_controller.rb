class Admin::EventersController < Admin::ApplicationController
  def index
    @q = Eventer.ransack(params[:q])
    @eventers = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    pagination_count(Eventer)
  end

  def show
    @eventer = Eventer.find(params[:id])
    @collabo_events = @eventer.collaborators.map{|c| c.event}
    @follows = Friend.where(from_user_id: @eventer.id).map{|f| Eventer.find(f.to_user_id)}
    @followers = Friend.where(to_user_id: @eventer.id).map{|f| Eventer.find(f.from_user_id)}
  end
end
