class DiscussionsController < ApplicationController
  def show
    @discussion = Discussion.find_by_url!(params[:id])
    @message = Message.new
    @messages = @discussion.ordered_messages
  end

  def edit
    @discussion = Discussion.find_by_url!(params[:id])
  end

  def update
    @discussion = Discussion.find_by_url!(params[:id])
    subject_params = params[:text_subject] || params[:image_subject]
    @discussion.subject.update_attributes(subject_params)
    @discussion.update_attributes(params[:discussion])
    redirect_to @discussion
  end
end
