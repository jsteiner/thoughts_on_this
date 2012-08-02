class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  helper_method :user_or_guest_id

  def current_user
    super || Guest.new(session[:name])
  end

  def user_or_guest_id
    (current_user.id || session[:guest_id]).to_s
  end
end
