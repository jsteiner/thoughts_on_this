class MessagesController < ApplicationController
  def create
    if current_user.has_full_name?
      discussion = Discussion.find_by_url!(params[:discussion_id])
      message_params = params[:message].merge(user_name: current_user.full_name)
      @message = discussion.messages.create(message_params)
      Pusher[discussion.url].trigger('new_message', { message: render_to_string(@message), user_id: current_user.id.to_s, user_number: @message.user_number })
    end

    render nothing: true
  end
end
