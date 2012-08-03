class ImageSubjectsController < ApplicationController
  before_filter :authorize

  respond_to :json

  def create
    @image_subject = current_user.image_subjects.new(image: params[:file])
    @image_subject.save
    respond_with @image_subject
  end
end
