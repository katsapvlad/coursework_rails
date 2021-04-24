class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "Success!!!"
      render action: 'create'
      session[:user_id] = @user.id
    else
      flash.now[:notice] = "#{@user.errors.full_messages}"
      render action: 'create'
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.now[:notice] = "Success!!!"
      render action: 'login'
    else
      flash.now[:notice] = "Invalid email or password"
      render action: 'login'
    end
  end
end
