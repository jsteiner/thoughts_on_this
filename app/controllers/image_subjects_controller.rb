class ImageSubjectsController < ApplicationController
  before_filter :authorize

  respond_to :json

  def create
    @image_subject = current_user.image_subjects.new(image: params[:discussion][:image])

    if @image_subject.save
      render json: @image_subject
    else
      head :bad_request
    end
  end
end
