class SessionsController < ApplicationController
  def new

  end

  def create
    admin = Admin.find_by(email: params[:email])
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    elsif admin.present? && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin_id] = nil
    redirect_to root_path
  end
end