class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      flash[:notice] = "Article was saved."
      redirect_to @article
    else
      flash[:error] = "There was an eror saving the article. Please try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Post was updated."
      redirect_to @article
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render :edit
    end
  end


end
