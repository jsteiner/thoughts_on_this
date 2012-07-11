class PagesController < HighVoltage::PagesController
  before_filter :redirect_to_dashboard
  layout 'basic'

  private

  def redirect_to_dashboard
    if params[:id] == 'homepage' && signed_in?
      redirect_to dashboard_url
    end
  end
end
