class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])
  end

  def new
    @article = Article.new
    @wiki = Wiki.find(params[:wiki_id])
    authorize! :create, Article, message: "You need to be a member to create a new article."
  end

  def create
    @wiki = Wiki.find(params[:id])
    @article = current_user.articles.build(params[:article])
    authorize! :create, @article, message: "You need to be signed up to do that."
    if @article.save
      redirect_to [@wiki, @article], notice: "Article was saved."
    else
      flash[:error] = "There was an eror saving the article. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
    authorize! :edit, @article, message: "You need to own the article to edit it."
  end

  def update
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:id])
    authorize! :update, @article, message: "You need to own the article to edit it."
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to [@wiki, @article], notice: "Article was saved succesfully."
    else
      flash[:error] = "There was an error saving the article. Please try again."
      render :edit
    end
  end


end
