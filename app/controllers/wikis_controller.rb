class WikisController < ApplicationController
  def index
    @wikis = Wiki.visible_to(current_user).paginate(page: params[:page], per_page: 10)
  end

  def new
    @wiki = Wiki.new
    authorize! :create, @wiki, message: "You need to be an admin to do that."
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize! :read, Wiki, message: "You need to be signed in to do that."
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You need to be an admin to do that."
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    authorize! :create, @wiki, message: "You need to be an admin to do that."
    if @wiki.save
      redirect_to @wiki, notice: "Wiki was saved succesfully."
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You need to own the wiki to update it."
    if @wiki.update_attributes(params[:wiki])
      redirect_to @wiki, notice: "Wiki was saved succesfully."
    else
      flash[:error] = "Error saving wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    authorize! :destroy, @wiki, message: "You need to own that wiki to delete it."
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting this wiki."
      render :show
    end
  end


end
