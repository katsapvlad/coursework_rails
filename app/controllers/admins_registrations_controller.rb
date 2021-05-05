class AdminsRegistrationsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      flash.now[:notice] = 'Success!!!'
      render action: 'new'
    else
      flash.now[:notice] = @admin.errors.full_messages.to_s
      render action: 'new'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
