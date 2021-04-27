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
    @news = News.all
    if news_item.save
      flash.now[:notice] = 'Success!'
      render action: 'new'
    else
      flash.now[:notice] = news_item.errors.full_messages.to_s
      render action: 'new'
    end
  end

  def show
    @news_item = News.find_by_id(params[:id])
    @news_comments = NewsComment.where('news_id = ?', params[:id])
  end

  def destroy
    news_item = News.find(params[:destroy_id])
    if news_item.destroy
      @news = News.all
      flash.now[:notice] = 'Success!'
      render action: 'index'
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
