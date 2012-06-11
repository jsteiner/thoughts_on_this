class NamesController < ApplicationController
  def create
    if current_user.persisted?
      current_user.update_attributes(first_name: params[:first_name], last_name: params[:last_name])
    else
      session[:first_name] = params[:first_name]
      session[:last_name] = params[:last_name]
    end
    redirect_to Discussion.find_by_url!(params[:discussion_id])
  end
end
