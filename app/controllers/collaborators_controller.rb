class CollaboratorsController < ApplicationController
  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params[:collaborator])
    if @collaborator.save
      flash[:notice] = "Collaborator was saved succesfully."
    else
      flash[:error] = "There was an error saving your collaborator. Please try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])
    if @collaborator.destroy
      flash[:notice] = "\"#{collaborator}\" was deleted succesfully"
      redirect_to collaborator_index_path
    else
      flash[:error] = "There was an error deleting your collaborator. Please try again."
      render :show
    end
  end
end
