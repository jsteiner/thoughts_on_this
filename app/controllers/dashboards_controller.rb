class DashboardsController < ApplicationController
  before_filter :authorize

  def show
    @image_subject = ImageSubject.new
    @discussions = current_user.discussions
  end
end
