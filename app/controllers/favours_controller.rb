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
      #render :js => "alert(#{favour.errors.objects.first.full_message})"
      #render js: "alert('test)";
      #render plain: "#{favour.errors.objects.first.full_message}"
       # render(
       #   html: "<script>alert('#{favour.errors.objects.first.full_message}')</script>".html_safe,
       #   layout: 'application'
       # )
      #flash.alert = "AAAAAAAAAAAAAAAAAAA"
      #render action: 'new'
      #flash.alert = "AAAAAAAAAAAAAAAAAAA"
      flash.now[:notice] = "#{favour.errors.objects.first.full_message}"
      render action: 'new'
    end
  end

  private

  def favour_params
    params.permit(:title, :description, :price, :image_link)
  end
end
