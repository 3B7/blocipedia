class CollaboratorController < ApplicationController
  def index
    @collaborator = Collaborator.all
  end

  def create
    @collaborator = Collaborator.new(params[:id])
    if @collaborator.save
      redirect_to @collaborator, notice: "Collaborator was saved succesfully."
    else
      flash[:error] = "There was an error saving your collaborator. Please try again."
      render :new
    end
  end

  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "\"#{collaborator}\" was deleted succesfully"
      redirect_to collaborator_path
    else
      flash[:error] = "There was an error deleting your collaborator. Please try again."
      render :show
  end
end
