class PagesController < HighVoltage::PagesController
  layout 'basic'

  before_filter :redirect_to_dashboard

  private

  def redirect_to_dashboard
    if params[:id] == 'homepage' && signed_in?
      redirect_to dashboard_url
    end
  end
end
