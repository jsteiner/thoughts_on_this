class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  def current_user
    super || Guest.new(session[:email])
  end
end
