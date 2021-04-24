class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  add_flash_types :info, :error, :warning

  # def current_user
  #   if session[:user_id]
  #     User.find_by_id(session[:user_id])
  #   end
  # end
end
