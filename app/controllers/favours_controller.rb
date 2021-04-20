class FavoursController < ApplicationController
  def index
  end

  def new
  end

  def create
    favour = Favour.new(favours_params)

    if favour.save
      render action: 'index'
    else
      render action: 'new'
    end
  end

  private

  def favours_params
    params.permit(:title, :description, :price, :image_link)
  end
end
