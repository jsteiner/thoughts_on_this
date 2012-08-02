class NamesController < ApplicationController
  def create
    if current_user.persisted?
      current_user.update_attributes(name: params[:name])
    else
      session[:name] = params[:name]
      assign_guest_id
    end
    redirect_to Discussion.find_by_url!(params[:discussion_id])
  end

  private

  def assign_guest_id
    session[:guest_id] = Digest::SHA2.hexdigest("#{session[:name]}:#{Time.now}")
  end
end
