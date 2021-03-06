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
      flash[:notice] = "There was an error saving your collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator was deleted succesfully"
    else
      flash[:error] = "There was an error deleting your collaborator. Please try again."
    end
    redirect_to wiki_collaborators_path(@wiki)
  end
end
