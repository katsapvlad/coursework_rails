class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
    @admin_id = Admin.find(session[:admin_id]).id
  end

  def create
    article = Article.new(article_params)
    if article.save
      flash.now[:notice] = 'Success!'
      redirect_to '/articles'
    else
      flash.now[:notice] = article.errors.full_messages.to_s
      render action: 'new'
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
    @article_comments = ArticleComment.where('article_id = ?', params[:id])
    if session[:user_id] != nil
      @user_id = User.find(session[:user_id]).id
    end
  end

  def destroy
    article = Article.find(params[:destroy_id])
    if article.destroy
      flash.now[:notice] = 'Success!'
      redirect_to '/articles'
    else
      flash.now[:notice] = article.errors.full_messages.to_s
      render action: 'destroy'
    end
  end

  private

  def article_params
    params.permit(:title, :text, :admin_id, :image_link)
  end
end
