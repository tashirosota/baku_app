class Admin::FriendsController < Admin::ApplicationController
  def index
    @friends = Friend.order(created_at: :desc).page(params[:page])
  end
end
