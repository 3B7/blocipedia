class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize! :create, Article, message: "You need to be a member to create a new article."
  end

  def create
    @article = current_user.articles.build(params[:article])
    authorize! :create, @article, message: "You need to be signed up to do that."
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
    authorize! :edit, @article, message: "You need to own the article to edit it."
  end

  def update
    @article = Article.find(params[:id])
    authorize! :update, @article, message: "You need to own the article to edit it."
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to @article
    else
      flash[:error] = "There was an error saving the article. Please try again."
      render :edit
    end
  end


end
