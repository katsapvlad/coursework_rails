class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  add_flash_types :info, :error, :warning
end
