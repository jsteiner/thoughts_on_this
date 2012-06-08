class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find(params[:id])
    @message = Message.new
    @messages = @discussion.messages
  end
end
