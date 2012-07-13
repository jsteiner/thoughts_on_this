class TextSubjectsController < ApplicationController
  before_filter :authorize

  def create
    @text_subject = TextSubject.new(params[:text_subject])
    @discussion = current_user.discussions.new(name: params[:discussion_name])
    @discussion.subject = @text_subject

    if @discussion.save
      redirect_to @discussion
    else
      @image_subject = ImageSubject.new
      @discussions = current_user.discussions.persisted
      render 'dashboards/show'
    end
  end
end
