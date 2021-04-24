class FavoursController < ApplicationController
  def index
    @favours = Favour.all
  end

  def new
  end

  def create
    favour = Favour.new(favour_params)
    @favours = Favour.all
    if favour.save
      render action: 'index'
    else
      flash.now[:notice] = "#{favour.errors.objects.first.full_message}"
      render action: 'new'
    end
  end

  private

  def favour_params
    params.permit(:title, :description, :price, :image_link)
  end
end
