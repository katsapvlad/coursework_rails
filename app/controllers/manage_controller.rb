class ManageController < ApplicationController
  def index
    redirect_to root_path unless session[:admin_id]
  end

  def delete
    redirect_to root_path unless session[:admin_id]
  end
end
