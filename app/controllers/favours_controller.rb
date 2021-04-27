class FavoursController < ApplicationController
  def index
    @favours = Favour.all
  end

  def new
    redirect_to root_path unless session[:admin_id]
  end

  def create
    favour = Favour.new(favour_params)
    @favours = Favour.all
    if favour.save
      flash.now[:notice] = 'Success!'
      render action: 'new'
    else
      flash.now[:notice] = favour.errors.full_messages.to_s
      render action: 'new'
    end
  end

  def show
    id = params[:id]
    @favour = Favour.find_by_id(id)
  end

  def destroy
    favour = Favour.find(params[:destroy_id])
    if favour.destroy
      @favours = Favour.all
      flash.now[:notice] = 'Success!'
      render action: 'index'
    else
      flash.now[:notice] = favour.errors.full_messages.to_s
      render action: 'destroy'
    end
  end

  private

  def favour_params
    params.permit(:title, :description, :price, :image_link)
  end
end
