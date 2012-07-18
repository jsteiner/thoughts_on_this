class ImageSubjectsController < ApplicationController
  before_filter :authorize

  def create
    @image_subject = ImageSubject.new(params[:image_subject])
    @discussion = current_user.discussions.new(name: params[:image_discussion_name])
    @discussion.subject = @image_subject

    if @discussion.save
      redirect_to @discussion
    else
      @text_subject = TextSubject.new
      @discussions = current_user.discussions.persisted
      render 'dashboards/show'
    end
  end
end
