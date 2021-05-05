class SuccessController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    AdminNotifierMailer.send_email_about_consultation(@user).deliver
  end
end
