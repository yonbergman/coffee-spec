module PagesSupport
  extend ControllerSupport::Base

  helper_method :current_page

  def current_page
    @page ||= load_page
  end

  def preload_page
    redirect_to '404' unless current_page.present?
  end

  private

  def load_page
    current_user.pages.find(params[:page_id] || params[:id])
  end

end