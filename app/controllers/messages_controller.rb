class MessagesController < ApplicationController
  def create
    if current_user.has_name?
      discussion = Discussion.find(params[:discussion_id])
      message_params = params[:message].merge(user_name: current_user.full_name)
      @message = discussion.messages.create(message_params)
    end
  end
end
