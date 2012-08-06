class DiscussionsController < ApplicationController
  def index
    @discussions = current_user.discussion_timeline
  end

  def show
    @discussion = Discussion.find_by_url!(params[:id])
    @message = Message.new
    @messages = @discussion.ordered_messages
    @current_user_number = @discussion.user_number(current_user.name)
  end

  def create
    @discussion = current_user.discussions.new(name: params[:discussion][:name])
    @discussion.subject = find_or_create_image_subject

    if @discussion.save
      redirect_to @discussion
    else
      @image_subject = ImageSubject.new
      @text_subject = TextSubject.new
      render 'dashboards/show'
    end
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

  private

  def find_or_create_image_subject
    current_user.image_subjects.find_by_id(params[:discussion][:subject_id]) || ImageSubject.new(image: params[:discussion][:image])
  end
end
