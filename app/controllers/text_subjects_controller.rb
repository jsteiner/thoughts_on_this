class TextSubjectsController < ApplicationController
  def create
    @text_subject = TextSubject.new(params[:text_subject])
    @discussion = current_user.discussions.new(name: params[:discussion_name])
    @discussion.subject = @text_subject

    if @discussion.save
      redirect_to @discussion
    else
      @discussions = current_user.discussions.persisted
      render 'dashboards/show'
    end
  end
end
