class GuestsController < ApplicationController
  def create
    session[:email] = params[:guest][:email]
    redirect_to Discussion.find(params[:discussion_id])
  end
end
