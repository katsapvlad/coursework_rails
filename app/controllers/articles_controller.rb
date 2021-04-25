class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
  end

  def create
    article = Article.new(article_params)
    @articles = Article.all
    if article.save
      flash.now[:notice] = "Success!"
      render action: 'new'
    else
      flash.now[:notice] = "#{article.errors.full_messages}"
      render action: 'new'
    end
  end

  def show
    id = params[:id]
    @article = Article.find_by_id(id)
  end

  def destroy
    article = Article.find(params[:destroy_id])
    if article.destroy
      @articles = Article.all
      flash.now[:notice] = "Success!"
      render action: 'index'
    else
      flash.now[:notice] = "#{article.errors.full_messages}"
      render action: 'destroy'
    end
  end

  private

  def article_params
    params.permit(:title, :text, :admin_id, :image_link)
  end
end
