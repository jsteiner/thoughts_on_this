class SessionsController < Clearance::SessionsController

  private

  def url_after_create
    dashboard_path
  end
end
