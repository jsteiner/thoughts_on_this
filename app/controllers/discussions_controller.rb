class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find(params[:id])
  end
end
