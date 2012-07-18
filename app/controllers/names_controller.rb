class NamesController < ApplicationController
  def create
    if current_user.persisted?
      current_user.update_attributes(name: params[:name])
    else
      session[:name] = params[:name]
    end
    redirect_to Discussion.find_by_url!(params[:discussion_id])
  end
end
