class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
    @admin_id = Admin.find(session[:admin_id]).id
  end

  def create
    news_item = News.new(news_params)
    if news_item.save
      redirect_to '/news'
    else
      flash.now[:notice] = news_item.errors.full_messages.to_s
      render action: 'new'
    end
  end

  def show
    @news_item = News.find_by_id(params[:id])
    @news_comments = NewsComment.where('news_id = ?', params[:id])
    if session[:user_id]
      @user_id = User.find(session[:user_id]).id
    end
  end

  def destroy
    news_item = News.find(params[:destroy_id])
    if news_item.destroy
      @news = News.all
      redirect_to '/news'
    else
      flash.now[:notice] = news_item.errors.full_messages.to_s
      render action: 'destroy'
    end
  end

  private

  def news_params
    params.permit(:title, :text, :admin_id, :image_link)
  end
end
