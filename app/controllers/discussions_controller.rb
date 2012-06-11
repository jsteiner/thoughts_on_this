class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find_by_url!(params[:id])
    @message = Message.new
    @messages = @discussion.ordered_messages
  end
end
