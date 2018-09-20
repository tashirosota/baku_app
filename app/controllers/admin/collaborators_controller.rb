class Admin::CollaboratorsController < Admin::ApplicationController
  def index
    @collaborators = Collaborator.order(created_at: :desc).page(params[:page]).per(100)
  end

  def show
    @collaborator = Collaborator.find(params[:id])
  end
end
