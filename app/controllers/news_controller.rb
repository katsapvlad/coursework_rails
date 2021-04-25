class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
  end

  def create
    news_item = News.new(news_params)
    @news = News.all
    if news_item.save
      flash.now[:notice] = "Success!"
      render action: 'new'
    else
      flash.now[:notice] = "#{news_item.errors.full_messages}"
      render action: 'new'
    end
  end

  def show
    id = params[:id]
    @news_item = News.find_by_id(id)
  end

  def destroy
    news_item = News.find(params[:destroy_id])
    if news_item.destroy
      @news = News.all
      flash.now[:notice] = "Success!"
      render action: 'index'
    else
      flash.now[:notice] = "#{news_item.errors.full_messages}"
      render action: 'destroy'
    end
  end

  private

  def news_params
    params.permit(:title, :text, :admin_id, :image_link)
  end
end
