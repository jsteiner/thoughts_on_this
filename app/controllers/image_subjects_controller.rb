class ImageSubjectsController < ApplicationController
  before_filter :authorize

  def create
    image_subject = ImageSubject.new(params[:image_subject])
    @discussion = current_user.discussions.new(name: params[:discussion_name])
    @discussion.subject = image_subject

    if @discussion.save
      redirect_to @discussion
    else
      render dashboard_path
    end
  end
end
